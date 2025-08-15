import 'package:betterme_quiz/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:betterme_quiz/core/locale/locale_bloc.dart';
import 'package:betterme_quiz/core/locale/locale_event.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showBackButton;
  final bool showMenuButton;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showMenuButton = true,
    this.onBack,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: widget.showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed:
                  widget.onBack ??
                  () {
                    Navigator.of(context).pop();
                  },
            )
          : null,
      title: widget.title,
      centerTitle: true,
      actions: [
        if (widget.showMenuButton)
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.menu, color: Colors.black),
            onSelected: (Locale locale) {
              context.read<LocaleBloc>().add(LocaleChanged(locale));
            },
            color: Colors.white,
            itemBuilder: (BuildContext context) {
              return AppLocalizations.supportedLocales.map((Locale locale) {
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Text(
                    locale.languageCode == 'en' ? 'English' : 'Русский',
                  ),
                );
              }).toList();
            },
          ),
      ],
    );
  }
}
