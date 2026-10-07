import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:nectar_store/core/constants/app_colors.dart';
import 'package:nectar_store/core/theme/app_text_styles.dart';
import 'package:nectar_store/core/utils/app_snackbar.dart';
import 'package:nectar_store/core/utils/validators.dart';
import 'package:nectar_store/core/widgets/app_button.dart';
import 'package:nectar_store/core/widgets/app_text_field.dart';
import 'package:nectar_store/features/auth/data/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.sendPasswordResetEmail(_emailController.text.trim());

      if (!mounted) return;

      AppSnackBar.showSuccess(context, 'Reset link sent to your email');

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for this email';
          break;

        case 'invalid-email':
          message = 'Invalid email';
          break;

        case 'too-many-requests':
          message = 'Too many requests. Try again later';
          break;

        default:
          message = e.message ?? 'Something went wrong';
      }

      if (mounted) {
        AppSnackBar.showError(context, message);
      }
    } catch (e) {
      if (mounted) {
        AppSnackBar.showError(context, 'Error: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const Text('Forgot Password?', style: AppTextStyles.title),

                const SizedBox(height: 10),

                const Text(
                  'Enter your email and we will send you a reset link.',
                  style: AppTextStyles.subtitle,
                ),

                const SizedBox(height: 60),

                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),

                const SizedBox(height: 40),

                AppButton(
                  text: 'Send Reset Link',
                  onPressed: _sendResetLink,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
