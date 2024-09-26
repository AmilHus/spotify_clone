import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_text_styles.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicAppButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 80)),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.buttonTextBold.copyWith(fontSize: 20),
      ),
    );
  }
}
