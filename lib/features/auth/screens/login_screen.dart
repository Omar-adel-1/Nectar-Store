import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:nectar_store/core/constants/app_colors.dart';
import 'package:nectar_store/core/routes/app_routes.dart';
import 'package:nectar_store/core/theme/app_text_styles.dart';
import 'package:nectar_store/core/utils/app_snackbar.dart';
import 'package:nectar_store/core/utils/validators.dart';
import 'package:nectar_store/core/widgets/app_button.dart';
import 'package:nectar_store/core/widgets/app_text_field.dart';
import 'package:nectar_store/features/auth/data/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    });

    try {
      await _authService.signInWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for this email';
          break;

        case 'wrong-password':
          message = 'Wrong password';
          break;

        case 'invalid-email':
          message = 'Invalid email';
          break;

        case 'invalid-credential':
          message = 'Email or password is incorrect';
          break;

        case 'user-disabled':
          message = 'This account has been disabled';
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
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),

                Image.asset('assets/images/Group-1.png', height: 55),

                const SizedBox(height: 80),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Login', style: AppTextStyles.title),
                ),

                const SizedBox(height: 8),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your email and password',
                    style: AppTextStyles.subtitle,
                  ),
                ),

                const SizedBox(height: 60),

                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),

                const SizedBox(height: 16),

                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: _obscurePassword,
                  validator: Validators.password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.forgotPassword);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: AppTextStyles.link,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                AppButton(text: 'Log In', onPressed: _login),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: AppTextStyles.subtitle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: const Text('Sign Up', style: AppTextStyles.link),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
