import 'package:flutter/material.dart';
import 'package:nectar_store/core/constants/app_colors.dart';

class AppSnackBar {
  AppSnackBar._();

  static void showSuccess(BuildContext context, String message) {
    _show(context, message, AppColors.primary);
  }

  static void showError(BuildContext context, String message) {
    _show(context, message, Colors.red);
  }

  static void _show(BuildContext context, String message, Color color) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
