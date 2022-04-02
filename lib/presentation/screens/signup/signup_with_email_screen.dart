import 'package:amplify_test/presentation/common/widgets/unfocus.dart';
import 'package:amplify_test/presentation/core/enums/gender.dart';
import 'package:amplify_test/presentation/core/enums/training_interval.dart';
import 'package:amplify_test/presentation/core/routes.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/sign_up_tab.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/signup_choose_password_form.dart';
import 'package:amplify_test/presentation/screens/signup/widgets/signup_with_email_form.dart';
import 'package:amplify_test/state/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupWithEmailScreen extends StatefulWidget {
  const SignupWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
  int tabIndex = 0;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var gender = Gender.male;
  var trainingInterval = TrainingInterval.onceAWeek;

  @override
  void initState() {
    super.initState();
    context.read<SignupCubit>().resetState();
  }

  void _next() {
    context.read<SignupCubit>().validateStep1(email: emailController.text);
  }

  void _continue() {
    context.read<SignupCubit>().validateStep2(
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabIndex == 0) {
          return true;
        }

        setState(() {
          tabIndex = 0;
        });
        return false;
      },
      child: Unfocus(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          bottomNavigationBar: BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignupStep1Valid) {
                setState(() {
                  tabIndex = 1;
                });
                context.read<SignupCubit>().resetState();
              }

              if (state is SignupStep2Valid) {
                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Signup Success')),
                  );

                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.login,
                  (_) => false,
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: tabIndex == 0 ? _next : _continue,
                child: Text(
                  tabIndex == 0 ? 'NEXT' : 'CONTINUE',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignUpTab(currentIndex: tabIndex),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: tabIndex == 0
                      ? SignupWithEmailForm(
                          emailController: emailController,
                          gender: gender,
                          onGenderChanged: (value) => setState(
                            () => gender = value ?? gender,
                          ),
                          trainingInterval: trainingInterval,
                          onTrainingIntervalChanged: (value) {
                            setState(
                              () =>
                                  trainingInterval = value ?? trainingInterval,
                            );
                          },
                        )
                      : SignupChoosePasswordForm(
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
