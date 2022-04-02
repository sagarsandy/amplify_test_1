import 'package:amplify_test/presentation/common/screens/not_found_screen.dart';
import 'package:amplify_test/presentation/screens/login/login_screen.dart';
import 'package:amplify_test/presentation/screens/signup/signup_screen.dart';
import 'package:amplify_test/presentation/screens/signup/signup_with_email_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const login = '/';
  static const signUp = '/sign_up';
  static const signUpWithEmail = '/sign_up_with_email';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case login:
            return const LoginScreen();
          case signUp:
            return const SignupScreen();
          case signUpWithEmail:
            return const SignupWithEmailScreen();
          default:
            return const NotFoundScreen();
        }
      },
    );
  }
}
