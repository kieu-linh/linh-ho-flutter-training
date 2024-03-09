import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:fitness_app/features/auth/sign_in/bloc/sign_in_event.dart';
import 'package:fitness_app/features/auth/sign_in/bloc/sign_in_state.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/form.dart';
import 'package:fitness_app/features/auth/sign_in/repository/auth_repository.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/font_weight.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(context.read<AuthRepository>()),
      child: BlocListener<SignInBloc, SignInState>(
        // function listener use to listen the state of the bloc
        listener: (context, state) {
          // if success go to favoriteScreen
          if (state.status == SubmissionStatus.success) {
            GoRouter.of(context).goNamed('homeScreen');
          }

          // if failure show snackbar with error message
          else if (state.status == SubmissionStatus.failure) {
            FASnackBar.error(context, message: state.errorMessage);
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: context.padding(horizontal: 20),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FATopNavigation(
                          onLeadingPress: () =>
                              context.go(AppRoutes.welcomeScreen.path),
                        ),
                        context.sizedBox(height: 30),
                        FAText.displayLarge(context,
                            text: context.l10n.fitnessTitle),
                        const SizedBox(height: 11),
                        Text(
                          context.l10n.signInText,
                          style: context.textTheme.headlineMedium,
                        ),
                        context.sizedBox(height: 39),
                        BlocBuilder<SignInBloc, SignInState>(
                          buildWhen: (previous, current) =>
                              previous.isEmailValid != current.isEmailValid ||
                              previous.status != current.status,
                          builder: (context, state) => EmailInput(
                            onChanged: (email) => context
                                .read<SignInBloc>()
                                .add(SignInEmailChanged(email: email)),
                            isValid: state.isEmailValid,
                            readOnly: state.status == SubmissionStatus.loading,
                          ),
                        ),
                        BlocBuilder<SignInBloc, SignInState>(
                          buildWhen: (previous, current) =>
                              previous.isValid != current.isValid ||
                              previous.status != current.status,
                          builder: (context, state) {
                            return PasswordInput(
                              hintText: context.l10n.passwordHintText,
                              onTap: () => Future.delayed(
                                  const Duration(milliseconds: 500), () {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent -
                                      400,
                                  duration: const Duration(milliseconds: 50),
                                  curve: Curves.ease,
                                );
                              }),
                              onSubmit: state.isValid
                                  ? () {
                                      context.read<SignInBloc>().add(
                                            SignInSubmitted(
                                              email: state.email,
                                              password: state.password,
                                            ),
                                          );
                                    }
                                  : null,
                              onChanged: (password) => context
                                  .read<SignInBloc>()
                                  .add(SignInPasswordChanged(
                                      password: password)),
                              readOnly:
                                  state.status == SubmissionStatus.loading,
                            );
                          },
                        ),
                        const SizedBox(height: 17),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                context.l10n.forgotPasswordText,
                                style: context.textTheme.bodyLarge,
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        context.sizedBox(height: 34),
                        BlocBuilder<SignInBloc, SignInState>(
                          buildWhen: (previous, current) =>
                              previous.isValid != current.isValid ||
                              previous.status != current.status,
                          builder: (context, state) {
                            return FAButton(
                              onPressed: state.isValid
                                  ? () {
                                      context.read<SignInBloc>().add(
                                            SignInSubmitted(
                                              email: state.email,
                                              password: state.password,
                                            ),
                                          );
                                    }
                                  : null,
                              color: state.isValid
                                  ? context.colorScheme.primary
                                  : context.colorScheme.outlineVariant,
                              text: context.l10n.loginText,
                              isLoading:
                                  state.status == SubmissionStatus.loading,
                            );
                          },
                        ),
                        context.sizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              context.l10n.loginWithText,
                              style: context.textTheme.bodySmall,
                            ),
                          ],
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
                        Padding(
                          padding: context.padding(bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: context.l10n.signInDescription,
                                      style: context.textTheme.labelSmall
                                          ?.copyWith(
                                        fontWeight: AppFontWeight.medium,
                                      ),
                                    ),
                                    TextSpan(
                                      text: context.l10n.registerText,
                                      style: context.textTheme.labelSmall,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            GoRouter.of(context).go('/sign-up'),
                                    ),
                                  ],
                                ),
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
          ),
        ),
      ),
    );
  }
}
