import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkIcon = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: context.padding(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FATopNavigation(
                      onLeadingPress: () =>
                          context.go(AppRoutes.loginScreen.path),
                    ),
                    context.sizedBox(height: 30),
                    FAText.displayLarge(context, text: 'FORGOT PASSWORD'),
                    const SizedBox(height: 11),
                    Text(
                      'Please enter your email below to receive \nyour password reset code.',
                      style: context.textTheme.headlineMedium,
                    ),
                    context.sizedBox(height: 99),
                    FAInput(
                      hintText: 'Email',
                      controller: emailController,
                      validator: FAValidator.validatorEmail,
                    ),
                    context.sizedBox(height: 109),
                    FAButton(
                      onPressed: () =>
                          context.go(AppRoutes.verifyAccountScreen.path),
                      text: 'RESET PASSWORD',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
