part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  bool? get stringify => true;
}

class SignupIdleState extends SignupState {
  const SignupIdleState();

  @override
  List<Object?> get props => [];
}

class SignupValidationErrorState extends SignupState {
  final String? emailValidationMessage;
  final List<String> passwordValidationMessages;

  const SignupValidationErrorState({
    this.emailValidationMessage,
    this.passwordValidationMessages = const [],
  });

  @override
  List<Object?> get props => [
        emailValidationMessage,
        passwordValidationMessages,
      ];
}

class SignupStep1Valid extends SignupState {
  const SignupStep1Valid();

  @override
  List<Object?> get props => [];
}

class SignupStep2Valid extends SignupState {
  const SignupStep2Valid();

  @override
  List<Object?> get props => [];
}
