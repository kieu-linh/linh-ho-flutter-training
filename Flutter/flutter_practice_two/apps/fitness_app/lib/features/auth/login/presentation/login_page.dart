import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/auth/login/bloc/login_bloc.dart';
import 'package:fitness_app/features/auth/login/bloc/login_event.dart';
import 'package:fitness_app/features/auth/login/bloc/login_state.dart';
import 'package:fitness_app/features/auth/login/presentation/form.dart';
import 'package:fitness_app/features/auth/login/repositories/auth_repository.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/font_weight.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(RepositoryProvider.of<AuthRepository>(context)),
      child: BlocListener<LoginBloc, LoginState>(
        // function listener use to listen the state of the bloc
        listener: (context, state) {
          // check state success or failure
          if (state.status == SubmissionStatus.success) {
            GoRouter.of(context).go('/favoriteScreen');
          }
          if (state.status == SubmissionStatus.failure) {
            FASnackBar.error(context, message: state.errorMessage);
          }
        },
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: context.padding(horizontal: 20),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
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
                          FAText.displayLarge(context, text: s.titleFitness),
                          const SizedBox(height: 11),
                          Text(
                            s.textSignIn,
                            style: context.textTheme.headlineMedium,
                          ),
                          context.sizedBox(height: 39),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return EmailInput(
                                onChanged: (email) {
                                  context
                                      .read<LoginBloc>()
                                      .add(LogInEmailChanged(email: email));
                                },
                                isEmailValid: state.isEmailValid,
                                readOnly: state.status == SubmissionStatus.loading
                                    ? true
                                    : false,
                              );
                            },
                            buildWhen: (previous, current) {
                              return previous.isEmailValid !=
                                      current.isEmailValid ||
                                  previous.status != current.status;
                            },
                          ),
                          const SizedBox(height: 14),
                          BlocBuilder<LoginBloc, LoginState>(
                            buildWhen: (previous, current) {
                              return previous.isValid != current.isValid ||
                                  previous.status != current.status;
                            },
                            builder: (context, state) {
                              return PasswordInput(
                                onTap: () {
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    _scrollController.animateTo(
                                      _scrollController
                                              .position.maxScrollExtent -
                                          400,
                                      duration:
                                          const Duration(milliseconds: 50),
                                      curve: Curves.ease,
                                    );
                                  });
                                },
                                onSubmit: state.isValid
                                    ? () {
                                        context.read<LoginBloc>().add(
                                              LoginSubmitted(
                                                email: state.email,
                                                password: state.password,
                                              ),
                                            );
                                      }
                                    : null,
                                onChanged: (value) {
                                  context.read<LoginBloc>().add(
                                      LogInPasswordChanged(password: value));
                                },
                                readOnly: state.status == SubmissionStatus.loading
                                    ? true
                                    : false,
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
                                  s.forgotPassword,
                                  style: context.textTheme.bodyLarge,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                          context.sizedBox(height: 34),
                          BlocBuilder<LoginBloc, LoginState>(
                            buildWhen: (previous, current) =>
                                previous.isValid != current.isValid ||
                                previous.status != current.status,
                            builder: (context, state) {
                              return FAButton(
                                onPressed: state.isValid
                                    ? () {
                                        context.read<LoginBloc>().add(
                                              LoginSubmitted(
                                                email: state.email,
                                                password: state.password,
                                              ),
                                            );
                                      }
                                    : null,
                                color: state.isValid
                                    ? context.colorScheme.primary
                                    : context.colorScheme.outlineVariant,
                                text: s.btnLoginIn,
                                isLoading: state.status == SubmissionStatus.loading,
                              );
                            },
                          ),
                          context.sizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                s.btnLoginWith,
                                style: context.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          FAButton.outline(
                            onPressed: () {},
                            icon: FAIcon.iconGoogle,
                            text: s.btnGoogle,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          const SizedBox(height: 8),
                          FAButton.text(
                            onPressed: () {},
                            icon: FAIcon.iconFacebook,
                            text: s.btnFacebook,
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
                                        text: s.descriptionSignIn,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith(
                                          fontWeight: AppFontWeight.medium,
                                        ),
                                      ),
                                      TextSpan(
                                        text: s.btnRegister,
                                        style: context.textTheme.labelSmall,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Go to Register page
                                          },
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
      ),
    );
  }
}
