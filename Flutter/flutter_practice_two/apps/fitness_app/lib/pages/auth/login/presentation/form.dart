import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_state.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({
    required this.emailController,
    super.key,
    this.onChanged,
  });

  final TextEditingController emailController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return FAInput(
          onChanged: onChanged,
          controller: emailController,
          hintText: s.hintTextEmail,
          icon: state.isUsernameValid ? FAIcon.iconTick : null,
          validator: FAValidator.validatorEmail,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    required this.passwordController,
    required this.onSubmit,
    super.key,
    this.onChanged,
  });
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAPasswordInput(
      controller: passwordController,
      hintText: s.hintTextPassword,
      obscureText: true,
      validator: FAValidator.validatorPassword,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onFieldSubmit: (p0) {
        onSubmit();
      },
    );
  }
}
