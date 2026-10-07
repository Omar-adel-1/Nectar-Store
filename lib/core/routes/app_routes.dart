import 'package:flutter/material.dart';
import 'package:nectar_store/features/auth/screens/forgot_password_screen.dart';
import 'package:nectar_store/features/auth/screens/login_screen.dart';
import 'package:nectar_store/features/auth/screens/get_started_screen.dart';
import 'package:nectar_store/features/auth/screens/signup_screen.dart';
import 'package:nectar_store/NavigationBar.dart';
import 'package:nectar_store/features/onboarding/on_boarding_screen.dart';
import 'package:nectar_store/features/search/screen/search_screen.dart';
import 'package:nectar_store/features/splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/sign-in';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String search = '/search';

  static final Map<String, WidgetBuilder> routes = {
    splash: (_) => SplashScreen(),

    onboarding: (_) => OnBoardingScreen(),

    signIn: (_) => GetStartedScreen(),

    login: (_) => LoginScreen(),

    signup: (_) => SignupScreen(),

    forgotPassword: (_) => ForgotPasswordScreen(),

    home: (_) => const NavigationBarScreen(),

    search: (_) => SearchScreen(),
  };
}
