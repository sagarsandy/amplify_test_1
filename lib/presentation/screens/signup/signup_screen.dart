import 'package:amplify_test/presentation/common/widgets/amplify_logo.dart';
import 'package:amplify_test/presentation/core/routes.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/facebook_button.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/google_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                const AmplifyLogo(),
                const SizedBox(height: 20),
                Text(
                  'GAIN BACK CONTROL\nOF YOUR LIFE',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                ),
                const SizedBox(height: 40),
                const FacebookButton(),
                const SizedBox(height: 10),
                const GoogleButton(),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.signUpWithEmail);
                  },
                  child: const Text('Sign up with Email address'),
                ),
                Divider(
                  thickness: .5,
                  height: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const _AlreadHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AlreadHaveAccount extends StatelessWidget {
  const _AlreadHaveAccount({Key? key}) : super(key: key);

  void _onTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final tapRecognizer = TapGestureRecognizer()..onTap = () => _onTap(context);

    return Text.rich(
      TextSpan(
        text: 'Already have an account? ',
        style:
            Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
        children: [
          TextSpan(
            text: 'Sign in',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            recognizer: tapRecognizer,
          ),
        ],
      ),
    );
  }
}
