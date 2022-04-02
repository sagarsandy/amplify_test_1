import 'package:amplify_test/presentation/core/enums/gender.dart';
import 'package:amplify_test/presentation/core/enums/training_interval.dart';
import 'package:dartz/dartz.dart';

class AuthService {
  Future<Either<String, Unit>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 5));
    return right(unit);
  }

  Future<Either<String, Unit>> signup({
    required String email,
    required String password,
    required Gender gender,
    required TrainingInterval trainingInterval,
  }) async {
    return right(unit);
  }
}
