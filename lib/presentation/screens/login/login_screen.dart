import 'package:amplify_test/presentation/common/widgets/amplify_logo.dart';
import 'package:amplify_test/presentation/common/widgets/unfocus.dart';
import 'package:amplify_test/presentation/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                const AmplifyLogo(),
                const SizedBox(height: 40),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
