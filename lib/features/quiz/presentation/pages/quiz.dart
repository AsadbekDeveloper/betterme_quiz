import 'package:betterme_quiz/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_event.dart';
import 'package:betterme_quiz/features/quiz/presentation/bloc/quiz_state.dart';
import 'package:betterme_quiz/features/quiz/presentation/widgets/custom_app_bar.dart';
import 'package:betterme_quiz/features/quiz/presentation/widgets/quiz_option_card.dart';
import 'package:betterme_quiz/features/quiz/data/models/question_type.dart';
import 'package:betterme_quiz/features/quiz/presentation/widgets/custom_progress_bar.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    context.read<QuizBloc>().add(LoadQuizEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          kToolbarHeight + 20.0,
        ), // Adjusted height for title + progress bar
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            int currentStep = 0;
            int totalSteps = 1; // Default to 1 to avoid division by zero

            if (state is QuizLoaded) {
              currentStep = state.currentQuestionIndex + 1;
              totalSteps = state.quiz.questions.length;
            }

            return CustomAppBar(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context)!.quiz,
                    style: TextStyle(color: Colors.black),
                  ),
                  if (currentStep + 1 < totalSteps)
                    const SizedBox(
                      height: 4.0,
                    ), // Space between title and progress bar
                  if (currentStep + 1 < totalSteps)
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width *
                          0.6, // 60% of screen width
                      child: CustomProgressBar(
                        currentStep: currentStep,
                        totalSteps: totalSteps,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey.shade300,
                        numberOfSegments: 6, // As per requirement
                      ),
                    ),
                ],
              ),
              onBack: () {
                // Handle back button logic, e.g., navigate to previous question or pop
                context.read<QuizBloc>().add(GoToPreviousQuestionEvent());
              },
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is QuizSubmissionSuccess) {
            if (mounted && context.mounted) {
              // Check if the widget is still mounted
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Quiz Completed!')));
              // Optionally navigate to a results page or home
            }
          }
        },
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            final currentQuestion =
                state.quiz.questions[state.currentQuestionIndex];
            final selectedOptions = state.userAnswers[currentQuestion.id] ?? [];

            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          currentQuestion.question,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: currentQuestion.options.length,
                          itemBuilder: (context, index) {
                            final option = currentQuestion.options[index];
                            final isSelected = selectedOptions.contains(
                              option.id,
                            );

                            final questionType = QuestionType.fromString(
                              currentQuestion.type,
                            );
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: QuizOptionCard(
                                text: option.text,
                                isSelected: isSelected,
                                questionType: questionType,
                                onTap: () {
                                  List<String> newSelectedOptions = List.from(
                                    selectedOptions,
                                  );
                                  if (questionType == QuestionType.single) {
                                    // First, update the selection immediately to show the border
                                    context.read<QuizBloc>().add(
                                      AnswerQuestionEvent(
                                        questionId: currentQuestion.id,
                                        selectedOptionIds: [option.id],
                                      ),
                                    );
                                    // Then, wait for a fraction of a second before going to the next question
                                    Future.delayed(
                                      const Duration(milliseconds: 300),
                                      () {
                                        if (context.mounted) {
                                          context.read<QuizBloc>().add(
                                            GoToNextQuestionEvent(),
                                          );
                                        }
                                      },
                                    );
                                  } else if (questionType ==
                                      QuestionType.multiple) {
                                    if (isSelected) {
                                      newSelectedOptions.remove(option.id);
                                    } else {
                                      newSelectedOptions.add(option.id);
                                    }
                                    context.read<QuizBloc>().add(
                                      UpdateMultipleChoiceSelectionEvent(
                                        questionId: currentQuestion.id,
                                        selectedOptionIds: newSelectedOptions,
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        if (currentQuestion.type ==
                            QuestionType.multiple.toStringValue())
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedOptions.isNotEmpty
                                    ? Colors.black
                                    : Colors.grey.shade300,
                                elevation: selectedOptions.isNotEmpty ? 3 : 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 24,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: selectedOptions.isNotEmpty
                                  ? () {
                                      context.read<QuizBloc>().add(
                                        AnswerQuestionEvent(
                                          questionId: currentQuestion.id,
                                          selectedOptionIds: selectedOptions,
                                        ),
                                      );
                                      context.read<QuizBloc>().add(
                                        GoToNextQuestionEvent(),
                                      );
                                    }
                                  : null,
                              child: Text(
                                AppLocalizations.of(context)!.next,
                                style: TextStyle(
                                  color: selectedOptions.isNotEmpty
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is QuizError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is QuizSubmissionSuccess) {
            return const Center(child: Text('Quiz Completed Successfully!'));
          }
          return const Center(child: Text('Welcome to the Quiz!'));
        },
      ),
    );
  }
}
