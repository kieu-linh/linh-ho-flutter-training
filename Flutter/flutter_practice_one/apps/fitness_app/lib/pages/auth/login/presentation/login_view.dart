// ignore: lines_longer_than_80_chars
// ignore_for_file: directives_ordering, inference_failure_on_instance_creation,, avoid_bool_literals_in_conditional_expressions
// avoid_bool_literals_in_conditional_expressions,
// no_leading_underscores_for_local_identifiers

import 'package:fitness_app/pages/auth/login/bloc/login_bloc.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_event.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_state.dart';
import 'package:fitness_app/pages/auth/login/presentation/form.dart';
import 'package:fitness_app/pages/auth/login/provider/login_provider.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/font_weight.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return LoginProvider(
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            GoRouter.of(context).go('/favoriteScreen');
          }
        },
        builder: (context, state) {
          void submitLogin() {
            if (formKey.currentState!.validate() == false) return;
            context.read<LoginBloc>().add(
                  LoginSubmitted(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
          }

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FATopNavigation(
                            onLeadingPress: () =>
                                context.go(AppRoutes.welcomeScreen.path),
                          ),
                          const SizedBox(height: 30),
                          FAText.displayLarge(context, text: s.displayLarge),
                          const SizedBox(height: 11),
                          Text(
                            s.displayMedium,
                            style: context.textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 39),
                          EmailForm(emailController: emailController),
                          const SizedBox(height: 14),
                          PasswordForm(
                            passwordController: passwordController,
                            onSubmit: submitLogin,
                          ),
                          const SizedBox(height: 17),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                s.forgotPassword,
                                style: context.textTheme.bodyLarge,
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          const SizedBox(height: 34),
                          FAButton(
                            onPressed: submitLogin,
                            text: s.btnLoginIn,
                            isDisable: state.status ==
                                    LoginStatus.onValueChangedSuccess
                                ? true
                                : false,
                          ),
                          const SizedBox(height: 24),
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
                            icon: FAIcons.iconGoogle,
                            text: s.btnGoogle,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          const SizedBox(height: 8),
                          FAButton.text(
                            onPressed: () {},
                            icon: FAIcons.iconFacebook,
                            text: s.btnFacebook,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          const SizedBox(height: 48),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
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
          );
        },
      ),
    );
  }
}
