import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/repository/auth_repository.dart';
import 'package:fitness_app/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:fitness_app/features/auth/sign_up/bloc/sign_up_event.dart';
import 'package:fitness_app/features/auth/sign_up/bloc/sign_up_state.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/font_weight.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(context.read<AuthRepository>()),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          // if success go to favoriteScreen
          if (state.status == SubmissionStatus.success) {
            FASnackBar.success(context, message: context.l10n.createAccount);
            context.go(AppRoutes.favoriteScreen.path);
          }

          // if failure show snackbar with error message
          else if (state.status == SubmissionStatus.failure) {
            FASnackBar.error(context, message: state.errorMessage);
          }

          /// hide snackbar
          else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Form(
              child: ListView(
                padding: context.padding(horizontal: 20).copyWith(bottom: 24.0),
                children: [
                  FATopNavigation(
                    onLeadingPress: () =>
                        context.go(AppRoutes.loginScreen.path),
                  ),
                  context.sizedBox(height: 30),
                  FAText.displayLarge(
                    context,
                    text: context.l10n.createAccountTitle,
                  ),
                  const SizedBox(height: 11),
                  Text(
                    context.l10n.signUpDescription,
                    style: context.textTheme.headlineMedium,
                  ),
                  context.sizedBox(height: 39),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.name != current.name,
                    builder: (context, state) => FAInput(
                      onChanged: (name) => context
                          .read<SignUpBloc>()
                          .add(SignUpNameChanged(name: name)),
                      readOnly: state.status == SubmissionStatus.loading,
                      hintText: context.l10n.fullNameText,
                      validator: (value) =>
                          FAValidator.validatorInput(state.name),
                    ),
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.isEmailValid != current.isEmailValid ||
                        previous.status != current.status,
                    builder: (context, state) => EmailInput(
                      onChanged: (email) => context
                          .read<SignUpBloc>()
                          .add(SignUpEmailChanged(email: email)),
                      isValid: state.isEmailValid,
                      readOnly: state.status == SubmissionStatus.loading,
                    ),
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.password != current.password ||
                        previous.status != current.status,
                    builder: (context, state) => PasswordInput(
                      onSubmit: () {},
                      hintText: context.l10n.passwordHintText,
                      textInputAction: TextInputAction.next,
                      onChanged: (password) => context
                          .read<SignUpBloc>()
                          .add(SignUpPasswordChanged(password: password)),
                      readOnly: state.status == SubmissionStatus.loading,
                    ),
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.confirmPassword != current.confirmPassword ||
                        previous.status != current.status,
                    builder: (context, state) => PasswordInput(
                      onSubmit: state.isValid
                          ? () {
                              context.read<SignUpBloc>().add(
                                    SignUpSubmitted(
                                      name: state.name,
                                      email: state.email,
                                      password: state.password,
                                      confirmPassword: state.confirmPassword,
                                    ),
                                  );
                            }
                          : null,
                      hintText: context.l10n.confirmPassText,
                      onChanged: (confirmPassword) => context
                          .read<SignUpBloc>()
                          .add(SignUpConfirmPasswordChanged(
                              confirmPassword: confirmPassword)),
                      readOnly: state.status == SubmissionStatus.loading,
                      validator: (value) {
                        return FAValidator.validatorConfirmPassword(
                            value, state.password);
                      },
                    ),
                  ),
                  context.sizedBox(height: 20),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    buildWhen: (previous, current) =>
                        previous.isValid != current.isValid ||
                        previous.status != current.status,
                    builder: (context, state) => FAButton(
                      onPressed: state.isValid
                          ? () {
                              context.read<SignUpBloc>().add(
                                    SignUpSubmitted(
                                      name: state.name,
                                      email: state.email,
                                      password: state.password,
                                      confirmPassword: state.confirmPassword,
                                    ),
                                  );
                            }
                          : null,
                      text: context.l10n.createAccountTitle,
                      color: state.isValid
                          ? context.colorScheme.primary
                          : context.colorScheme.outlineVariant,
                      isLoading: state.status == SubmissionStatus.loading,
                    ),
                  ),
                  context.sizedBox(height: 24),
                  Text(
                    context.l10n.registerWithText,
                    style: context.textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  FAButton.outline(
                    onPressed: () {},
                    icon: FAIcon.iconGoogle,
                    text: context.l10n.googleText,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SizedBox(height: 8),
                  FAButton.text(
                    onPressed: () {},
                    icon: FAIcon.iconFacebook,
                    text: context.l10n.facebookText,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  context.sizedBox(height: 48),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: context.l10n.haveAccountText,
                          style: context.textTheme.labelSmall?.copyWith(
                            fontWeight: AppFontWeight.medium,
                          ),
                        ),
                        TextSpan(
                          text: context.l10n.loginButtonText,
                          style: context.textTheme.labelSmall,
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => context.go(AppRoutes.loginScreen.path),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
