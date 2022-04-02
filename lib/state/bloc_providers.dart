import 'package:amplify_test/service/auth_service.dart';
import 'package:amplify_test/state/login/login_cubit.dart';
import 'package:amplify_test/state/signup/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _authService = AuthService();
final blocProviders = <BlocProvider>[
  BlocProvider<LoginCubit>(
    create: (_) => LoginCubit(authService: _authService),
  ),
  BlocProvider<SignupCubit>(
    create: (_) => SignupCubit(authService: _authService),
  ),
];
