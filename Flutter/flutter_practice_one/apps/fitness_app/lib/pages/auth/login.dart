import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/constant/icons.dart';
import 'package:flutter_practice_one/core/typography/font_weight.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/l10n/l10n.dart';
import 'package:flutter_practice_one/pages/favorite/favorite.dart';
import 'package:flutter_practice_one/widgets/text_field.dart';
import 'package:flutter_practice_one/widgets/top_control.dart';
import 'package:flutter_practice_one/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

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
                const FATopControl(),
                const SizedBox(height: 30),
                Text(
                  context.l10n.displayLarge,
                  style: AppTextStyles.headlineLarge,
                ),
                const SizedBox(height: 11),
                Text(
                  context.l10n.displayMedium,
                  style: AppTextStyles.headlineMedium,
                ),
                const SizedBox(height: 39),
                FAInput(
                  hintText: context.l10n.hintTextEmail,
                  icon: FAIcons.iconTick,
                ),
                const SizedBox(height: 14),
                FAInput(
                  hintText: context.l10n.hintTextPassword,
                  obscureText: !showPassword,
                  icon: showPassword ? FAIcons.iconEyeOpen : FAIcons.iconEye,
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.l10n.forgotPassword,
                      style: AppTextStyles.textTitle,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                FAButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      // ignore: inference_failure_on_instance_creation
                      MaterialPageRoute(
                        builder: (context) => const FavoritePage(),
                      ),
                      (route) => false,
                    );
                  },
                  text: context.l10n.btnLoginIn,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.btnLoginWith,
                      style: AppTextStyles.textSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FAButton.outline(
                  onPressed: () {},
                  icon: FAIcons.iconGoogle,
                  text: context.l10n.btnGoogle,
                ),
                const SizedBox(height: 8),
                FAButton.text(
                  onPressed: () {},
                  icon: FAIcons.iconFacebook,
                  text: context.l10n.btnFacebook,
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
                              style: AppTextStyles.textAppBar.copyWith(
                                fontWeight: AppFontWeight.medium,
                              ),
                            ),
                            TextSpan(
                              text: context.l10n.bntSignIn,
                              style: AppTextStyles.textAppBar,
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
