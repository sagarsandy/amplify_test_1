import 'package:amplify_test/presentation/core/constants.dart';
import 'package:amplify_test/service/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authService}) : super(const LoginIdleState());

  final AuthService authService;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    bool validationErrorExists = false;
    String? emailValidationMessage;
    String? passwordValidationMessage;

    if (!validateEmail(email)) {
      emailValidationMessage = 'Invalid email';
      validationErrorExists = true;
    }

    if (password.isEmpty) {
      passwordValidationMessage = 'Password is required';
      validationErrorExists = true;
    }

    if (validationErrorExists) {
      return emit(
        LoginValidationError(
          emailValidationMessage: emailValidationMessage,
          passwordValidationMessage: passwordValidationMessage,
        ),
      );
    }

    emit(const LoginLoadingState());

    final response = await authService.login(email: email, password: password);
    final newState = response.fold(
      (l) => LoginErrorState(message: l),
      (r) => const LoginSuccessState(),
    );

    emit(newState);
  }

  bool validateEmail(String email) {
    final regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
}
