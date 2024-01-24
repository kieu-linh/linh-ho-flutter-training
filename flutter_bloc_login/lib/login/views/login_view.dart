import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/home/home_page.dart';
import 'package:flutter_bloc_login/login/auth_validator.dart';
import 'package:flutter_bloc_login/login/bloc/login_bloc.dart';
import 'package:flutter_bloc_login/login/views/form/form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print('[Log] ${state.status}');
          if (state.status == LoginStatus.success) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sign up Home View'),
                  EmailForm(
                    emailController: emailController,
                  ),
                  const SizedBox(height: 20),
                  PasswordForm(passwordController: passwordController),
                  const SizedBox(height: 20),
                  LoginButton(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final isFormValid = FAValidator.checkLoginInValidator(
          email: state.email,
          password: state.password,
        );
        return ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(LoginSubmitted(
                  email: emailController.text,
                  password: passwordController.text,
                ));
            /*context.read<LoginBloc>().add(
              const LoginSubmitted(
                  email: 'email', password: 'password'),
            );*/
            /*context.read<LoginBloc>().add(
              LogInEmailChangedEvent(
                email: emailController.text,
              ),
            );*/
          },
          child: state.status == LoginStatus.loading
              ? const CircularProgressIndicator()
              : const Text('Login'),
        );
      },
    );
  }
}
