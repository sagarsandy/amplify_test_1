import 'package:amplify_test/presentation/common/widgets/app_text_field.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/label.dart';
import 'package:amplify_test/state/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupChoosePasswordForm extends StatelessWidget {
  const SignupChoosePasswordForm({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label('Choose a password'),
        const SizedBox(height: 20),
        AppTextField(
          controller: passwordController,
          filled: true,
          labelText: 'Password',
          password: true,
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: confirmPasswordController,
          filled: true,
          labelText: 'Confirm password',
          password: true,
        ),
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            if (state is! SignupValidationErrorState ||
                state.passwordValidationMessages.isEmpty) {
              return const SizedBox();
            }

            return Column(
              children: [
                const SizedBox(height: 20),
                for (final message in state.passwordValidationMessages)
                  Row(
                    children: [
                      const Icon(Icons.close, color: Colors.red),
                      const SizedBox(width: 10),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
