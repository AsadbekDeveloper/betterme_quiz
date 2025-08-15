import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title; // Changed from String to Widget
  final bool showBackButton;
  final bool showMenuButton;
  final VoidCallback? onBack;
  // Removed final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showMenuButton = true,
    this.onBack,
    // Removed this.bottom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20.0); // Adjusted height for title + progress bar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed:
                  onBack ??
                  () {
                    Navigator.of(context).pop();
                  },
            )
          : null,
      title: title, // Now accepts a Widget
      centerTitle: true,
      actions: [
        if (showMenuButton)
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Handle menu button press
            },
          ),
      ],
      // Removed bottom: bottom,
    );
  }
}
