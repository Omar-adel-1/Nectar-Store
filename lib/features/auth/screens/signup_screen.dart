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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    });

    try {
      await _authService.signUp(
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (!mounted) return;

      AppSnackBar.showSuccess(context, 'Account created successfully');

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already registered';
          break;

        case 'invalid-email':
          message = 'Invalid email';
          break;

        case 'weak-password':
          message = 'Password is too weak';
          break;

        case 'operation-not-allowed':
          message = 'Email and password sign-in is not enabled';
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
            AppRoutes.login,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),

                const SizedBox(height: 20),

                Center(
                  child: Image.asset('assets/images/Group-1.png', height: 55),
                ),

                const SizedBox(height: 50),

                const Text('Sign Up', style: AppTextStyles.title),

                const SizedBox(height: 8),

                const Text(
                  'Create your account',
                  style: AppTextStyles.subtitle,
                ),

                const SizedBox(height: 45),

                AppTextField(
                  controller: _usernameController,
                  label: 'Username',
                  validator: Validators.username,
                ),

                const SizedBox(height: 16),

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

                const SizedBox(height: 16),

                AppTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  obscureText: _obscureConfirmPassword,
                  validator: (value) => Validators.confirmPassword(
                    value,
                    _passwordController.text,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                AppButton(text: 'Sign Up', onPressed: _signup),

                const SizedBox(height: 20),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.login,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Already have an account? Login',
                      style: AppTextStyles.link,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
