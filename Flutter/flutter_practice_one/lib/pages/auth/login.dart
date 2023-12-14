import 'package:flutter/material.dart';
import 'package:flutter_practice_one/core/typography/text_style.dart';
import 'package:flutter_practice_one/widgets/app_bar_auth.dart';
import 'package:flutter_practice_one/widgets/button.dart';
import 'package:flutter_practice_one/widgets/text_field.dart';
import 'package:flutter_practice_one/widgets/text_field_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAuth(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Pro Fitness!',
                style: AppTextStyles.headlineLarge,
              ),
              const SizedBox(height: 11),
              Text(
                'Hello there, sign in to \ncontinue!',
                style: AppTextStyles.headlineMedium,
              ),
              const SizedBox(height: 39),
              const FATextField(
                hintText: 'Email Address',
                icon: 'assets/icons/ic_tick.svg',
              ),
              const SizedBox(height: 14),
              const FATextFieldPassword(
                hintText: 'Password',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: AppTextStyles.textTitle,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(height: 34),
              FAButton(
                text: 'Login',
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or Login with',
                    style: AppTextStyles.textSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
