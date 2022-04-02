import 'package:amplify_test/presentation/core/app_theme.dart';
import 'package:amplify_test/presentation/core/routes.dart';
import 'package:amplify_test/state/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amplify Test',
        initialRoute: Routes.login,
        onGenerateRoute: Routes.onGenerateRoute,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.instance.darkTheme,
      ),
    );
  }
}
