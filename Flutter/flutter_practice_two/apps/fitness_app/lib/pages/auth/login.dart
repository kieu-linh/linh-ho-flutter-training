// ignore_for_file: directives_ordering, inference_failure_on_instance_creation

import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/core/typography/font_weight.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkIcon = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitLogin() async {
    if (formKey.currentState!.validate() == false) return;
    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() => isLoading = false);
    // ignore: use_build_context_synchronously
    GoRouter.of(context).go('/favoriteScreen');
  }

  void _checkValidatorEmail(String value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);
    checkIcon = regex.hasMatch(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
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
                  FAInput(
                    onChanged: _checkValidatorEmail,
                    controller: emailController,
                    hintText: s.hintTextEmail,
                    icon: checkIcon ? FAIcon.iconTick : null,
                    validator: FAValidator.validatorEmail,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 14),
                  FAPasswordInput(
                    controller: passwordController,
                    hintText: s.hintTextPassword,
                    obscureText: true,
                    validator: FAValidator.validatorPassword,
                    textInputAction: TextInputAction.done,
                    onFieldSubmit: (p0) {
                      _submitLogin();
                    },
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
                    onPressed: _submitLogin,
                    text: s.btnLoginIn,
                    isDisable: isLoading,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s.btnLoginWith, style: context.textTheme.bodySmall),
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
                                style: context.textTheme.labelSmall?.copyWith(
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
    );
  }
}
