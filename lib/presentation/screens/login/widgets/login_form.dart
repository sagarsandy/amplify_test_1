import 'package:amplify_test/gen/assets.gen.dart';
import 'package:amplify_test/presentation/common/dialogs/loading_dialog.dart';
import 'package:amplify_test/presentation/common/widgets/app_text_field.dart';
import 'package:amplify_test/presentation/core/routes.dart';
import 'package:amplify_test/state/login/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailUsernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    final close = showLoadingDialog(context);
    context
        .read<LoginCubit>()
        .login(
          email: emailUsernameController.text,
          password: passwordController.text,
        )
        .then((_) => close());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Login success')),
            );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            AppTextField(
              key: ValueKey('email$state'),
              controller: emailUsernameController,
              labelText: 'Username or Email address',
              autovalidateMode: state is LoginValidationError
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (_) {
                if (state is! LoginValidationError) return null;
                return state.emailValidationMessage;
              },
            ),
            const SizedBox(height: 10),
            AppTextField(
              key: ValueKey('password$state'),
              controller: passwordController,
              labelText: 'Password',
              password: true,
              autovalidateMode: state is LoginValidationError
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (_) {
                if (state is! LoginValidationError) return null;
                return state.passwordValidationMessage;
              },
            ),
            const SizedBox(height: 20),
            const _ForgottenPassword(),
            const SizedBox(height: 20),
            _LoginButton(onPressed: _login),
            const SizedBox(height: 40),
            _SocialLoginButton(
              onPressed: () {},
              text: 'Continue with Facebook',
              svg: Assets.facebook,
            ),
            const SizedBox(height: 20),
            _SocialLoginButton(
              onPressed: () {},
              text: 'Continue with Google',
              svg: Assets.google,
            ),
            Divider(
              thickness: .5,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            const _DontHaveAccount(),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailUsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class _ForgottenPassword extends StatelessWidget {
  const _ForgottenPassword({Key? key}) : super(key: key);

  void onTap(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Not implemented'),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final _tapRecognizer = TapGestureRecognizer()..onTap = () => onTap(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            text: 'Forgotten password',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            recognizer: _tapRecognizer,
          ),
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'LOG IN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.svg,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final SvgGenImage svg;

  @override
  Widget build(BuildContext context) {
    const size = Size.square(25);
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svg.svg(
            height: size.height,
            width: size.width,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _DontHaveAccount extends StatelessWidget {
  const _DontHaveAccount({Key? key}) : super(key: key);

  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    final tapRecognizer = TapGestureRecognizer()..onTap = () => _onTap(context);

    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        style:
            Theme.of(context).textTheme.caption?.copyWith(color: Colors.white),
        children: [
          TextSpan(
            text: 'Sign up',
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
