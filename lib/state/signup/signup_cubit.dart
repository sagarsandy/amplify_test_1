import 'package:amplify_test/presentation/core/constants.dart';
import 'package:amplify_test/service/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authService}) : super(const SignupIdleState());

  final AuthService authService;

  void validateStep1({required String email}) {
    final regex = RegExp(emailRegex);
    if (!regex.hasMatch(email)) {
      emit(
        const SignupValidationErrorState(
            emailValidationMessage: 'Invalid email'),
      );
    } else {
      emit(const SignupStep1Valid());
    }
  }

  void resetState() {
    emit(const SignupIdleState());
  }

  void validateStep2({
    required String password,
    required String confirmPassword,
  }) {
    final messages = <String>[];

    if (password.length < 8) {
      messages.add('Minimum of 8 characters');
    }

    if (password.toLowerCase() == password) {
      messages.add('A capital letter');
    }

    if (password.toUpperCase() == password) {
      messages.add('A lowercase letter');
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      messages.add('A number');
    }

    if (password != confirmPassword) {
      messages.add('Both boxes match');
    }

    if (messages.isEmpty) {
      emit(const SignupStep2Valid());
    } else {
      emit(
        SignupValidationErrorState(
          passwordValidationMessages: messages,
        ),
      );
    }
  }
}
