part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  bool? get stringify => true;
}

class LoginIdleState extends LoginState {
  const LoginIdleState();

  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();

  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();

  @override
  List<Object?> get props => [];
}

class LoginValidationError extends LoginState {
  final String? emailValidationMessage;
  final String? passwordValidationMessage;

  const LoginValidationError({
    this.emailValidationMessage,
    this.passwordValidationMessage,
  });

  @override
  List<Object?> get props => [
        emailValidationMessage,
        passwordValidationMessage,
      ];
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
