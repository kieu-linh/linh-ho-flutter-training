import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_event.dart';
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
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return FAInput(
          onChanged: (email) {
            context.read<LoginBloc>().add(LogInEmailChangedEvent(email: email));
          },
          controller: emailController,
          hintText: s.hintTextEmail,
          icon: state.isUsernameValid
              ? FAIcons.iconTick
              : null,
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
  });
  final TextEditingController passwordController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return FAInputPassword(
          controller: passwordController,
          hintText: s.hintTextPassword,
          onPressed: () {
            context.read<LoginBloc>().add(
                  LogInPasswordChangedEvent(state: state.status),
                );
          },
          icon: state.status == LoginStatus.onShowPassword
              ? FAIcons.iconEyeOpen
              : FAIcons.iconEye,
          obscureText:
              state.status == LoginStatus.onShowPassword ? false : true,
          validator: FAValidator.validatorPassword,
          textInputAction: TextInputAction.done,
          onFieldSubmit: (p0) {
            onSubmit();
          },
        );
      },
    );
  }
}
