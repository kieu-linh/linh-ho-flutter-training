import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/data/authentication_repository.dart';
import 'package:flutter_bloc_login/data/providers/dummy_auth_provider.dart';


import 'authentication/authentication.dart';
import 'home/home_page.dart';
import 'login/views/login_page.dart';

void main() {
  final authenticationRepository = AuthenticationRepository(
    authenticationProvider: DummyAuthProvider(),
  );
  runApp(MyApp(
    authenticationRepository: authenticationRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
            )..add(AuthenticationStarted()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return const HomePage();
              } else if (state is AuthenticationUnauthenticated) {
                return const LoginPage();
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
