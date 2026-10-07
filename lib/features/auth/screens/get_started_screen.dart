import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nectar_store/core/constants/app_colors.dart';
import 'package:nectar_store/core/routes/app_routes.dart';
import 'package:nectar_store/core/theme/app_text_styles.dart';
import 'package:nectar_store/core/utils/app_snackbar.dart';
import 'package:nectar_store/core/widgets/app_social_button.dart';
import 'package:nectar_store/features/auth/data/auth_service.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _authService.signInWithGoogle();

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    } on GoogleSignInException catch (e) {
      if (!mounted) return;

      AppSnackBar.showError(
        context,
        'Google Error: ${e.code} | ${e.description ?? ''}',
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      AppSnackBar.showError(
        context,
        'Firebase Error: ${e.code} | ${e.message ?? ''}',
      );
    } catch (e) {
      if (!mounted) return;

      AppSnackBar.showError(context, 'Error: $e');
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 350,
                width: 400,
                child: Image.asset('assets/images/singnIn.png'),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 120,
                width: 345,
                child: Text(
                  'Get your groceries \nwith nectar',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(height: 50),

              SizedBox(
                width: 345,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Continue with Email',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),

              SizedBox(height: 15),

              SizedBox(
                width: 345,
                child: AppSocialButton(
                  text: 'Continue with Google',
                  imagePath: 'assets/images/google.png',
                  backgroundColor: Color(0xFF5383EC),
                  onPressed: _isLoading ? null : _signInWithGoogle,
                  isLoading: _isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
