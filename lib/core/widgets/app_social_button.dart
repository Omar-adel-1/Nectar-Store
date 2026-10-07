import 'package:flutter/material.dart';
import 'package:nectar_store/core/theme/app_text_styles.dart';

class AppSocialButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final bool isLoading;

  const AppSocialButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
    required this.backgroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor.withOpacity(0.6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath, height: 30, fit: BoxFit.cover),
                  SizedBox(width: 18),
                  Text(text, style: AppTextStyles.buttonText),
                ],
              ),
      ),
    );
  }
}
