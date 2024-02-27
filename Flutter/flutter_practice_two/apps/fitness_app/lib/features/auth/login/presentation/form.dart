import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/login/bloc/login_bloc.dart';
import 'package:fitness_app/features/auth/login/bloc/login_state.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    super.key,
    this.onChanged,
  });


  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return FAInput(
          onChanged: onChanged,
          hintText: s.hintTextEmail,
          icon: state.isEmailValid ? FAIcon.iconTick : null,
          validator: FAValidator.validatorEmail,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    this.onSubmit,
    super.key,
    this.onChanged,
    this.onTap,
  });
  final VoidCallback? onSubmit;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return FAPasswordInput(
      hintText: s.hintTextPassword,
      obscureText: true,
      validator: FAValidator.validatorPassword,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmit: (_) {
        onSubmit?.call();
      },
    );
  }
}
