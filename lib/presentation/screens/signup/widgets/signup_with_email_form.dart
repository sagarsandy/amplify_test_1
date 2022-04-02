import 'package:amplify_test/presentation/common/widgets/app_dropdown_button.dart';
import 'package:amplify_test/presentation/common/widgets/app_text_field.dart';
import 'package:amplify_test/presentation/core/enums/gender.dart';
import 'package:amplify_test/presentation/core/enums/training_interval.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/gender_select_radio.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/label.dart';
import 'package:amplify_test/state/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupWithEmailForm extends StatelessWidget {
  const SignupWithEmailForm({
    Key? key,
    required this.emailController,
    required this.gender,
    required this.onGenderChanged,
    required this.trainingInterval,
    required this.onTrainingIntervalChanged,
  }) : super(key: key);

  final TextEditingController emailController;
  final Gender gender;
  final ValueChanged<Gender?> onGenderChanged;
  final TrainingInterval trainingInterval;
  final ValueChanged<TrainingInterval?> onTrainingIntervalChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label("What's your email address?"),
        const SizedBox(height: 20),
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return AppTextField(
              controller: emailController,
              labelText: 'Email',
              filled: true,
              autovalidateMode: state is SignupValidationErrorState
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              validator: (_) => state is SignupValidationErrorState
                  ? state.emailValidationMessage
                  : null,
            );
          },
        ),
        const SizedBox(height: 20),
        const Label("What's your gender?"),
        const SizedBox(height: 20),
        GenderSelectRadio(
          value: gender,
          onChanged: onGenderChanged,
        ),
        const SizedBox(height: 20),
        const Label('How much do you train?'),
        const SizedBox(height: 20),
        AppDropdownButton<TrainingInterval>(
          value: trainingInterval,
          filled: true,
          labelText: 'Training Interval',
          items: TrainingInterval.values
              .map(
                (interval) => DropdownMenuItem(
                  value: interval,
                  child: Text(interval.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value == null) return;
            onTrainingIntervalChanged(value);
          },
        ),
      ],
    );
  }
}
