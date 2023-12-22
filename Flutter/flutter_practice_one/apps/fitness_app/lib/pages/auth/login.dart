// ignore_for_file: directives_ordering, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/extension/extension.dart';
import 'package:flutter_practice_one/core/typography/font_weight.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/routes/routes.dart';
import 'package:flutter_practice_one/widgets/input.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FATopControl(
                  onPressed: () => context.go(AppRoutes.welcomeScreen.path),
                ),
                const SizedBox(height: 30),
                Text(
                  context.l10n.displayLarge,
                  style: context.textTheme.headlineLarge,
                ),
                const SizedBox(height: 11),
                Text(
                  context.l10n.displayMedium,
                  style: context.textTheme.headlineMedium,
                ),
                const SizedBox(height: 39),
                FAInput(
                  controller: emailController,
                  hintText: context.l10n.hintTextEmail,
                  icon: FAIcons.iconTick,
                ),
                const SizedBox(height: 14),
                FAInput(
                  controller: passwordController,
                  hintText: context.l10n.hintTextPassword,
                  icon: FAIcons.iconEye,
                  obscureText: true,
                ),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.l10n.forgotPassword,
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                FAButton(
                  onPressed: () => GoRouter.of(context).go('/favoriteScreen'),
                  text: context.l10n.btnLoginIn,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.btnLoginWith,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FAButton.outline(
                  onPressed: () {},
                  icon: FAIcons.iconGoogle,
                  text: context.l10n.btnGoogle,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                const SizedBox(height: 8),
                FAButton.text(
                  onPressed: () {},
                  icon: FAIcons.iconFacebook,
                  text: context.l10n.btnFacebook,
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
                              text: context.l10n.descriptionSignIn,
                              style: context.textTheme.labelSmall?.copyWith(
                                fontWeight: AppFontWeight.medium,
                              ),
                            ),
                            TextSpan(
                              text: context.l10n.bntSignIn,
                              style: context.textTheme.labelSmall,
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
    );
  }
}
