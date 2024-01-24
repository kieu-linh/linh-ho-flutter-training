import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/login/bloc/login_bloc.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          focusNode: FocusNode(),
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            labelText: 'EnterEmail',
            errorText: (state.status == LoginStatus.onEmailChangedFailure)
                ? 'Invalid Email'
                : null,
            errorBorder: (state.status == LoginStatus.onEmailChangedFailure)
                ? InputBorder.none
                : null,
            errorStyle: (state.status == LoginStatus.onEmailChangedFailure)
                ? const TextStyle(color: Colors.red)
                : null,
            errorMaxLines: 2,
          ),
          onChanged: (email) => context
              .read<LoginBloc>()
              .add(LogInEmailChangedEvent(email: email)),
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          textInputAction: TextInputAction.next,
          showCursor: true,
        );
      },
    );
  }
}

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          focusNode: FocusNode(),
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Enter password',
            errorText: (state.status == LoginStatus.onPasswordChangedFailure)
                ? 'Invalid Password'
                : null,
            errorBorder: (state.status == LoginStatus.onPasswordChangedFailure)
                ? InputBorder.none
                : null,
            errorStyle: (state.status == LoginStatus.onPasswordChangedFailure)
                ? const TextStyle(color: Colors.red)
                : null,
            errorMaxLines: 2,
          ),
          onChanged: (password) => context
              .read<LoginBloc>()
              .add(LogInPasswordChangedEvent(password: password)),
          /*onChanged: (email) => context
              .read<LoginBloc>()
              .add(LogInEmailChangedEvent(email: email)),*/
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          textInputAction: TextInputAction.next,
          showCursor: true,
        );
      },
    );
  }
}
