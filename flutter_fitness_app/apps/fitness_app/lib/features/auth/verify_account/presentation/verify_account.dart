import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyAccountPage extends StatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
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
                    FAText.displayLarge(context, text: 'VERIFY ACCOUNT'),
                    const SizedBox(height: 11),
                    Text(
                      'Verify your account by entering verification code we sent to',
                      style: context.textTheme.headlineMedium,
                      maxLines: 2,
                    ),
                    context.sizedBox(height: 99),
                    PinCodeTextField(
                      //controller: verificationCodeController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      appContext: context,
                      textStyle:
                          context.textTheme.bodyLarge?.copyWith(fontSize: 20.0),
                      length: 4,
                      cursorColor: context.colorScheme.primary,
                      cursorHeight: 20.0,
                      cursorWidth: 2.0,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8.6),
                        fieldHeight: 50.0,
                        fieldWidth: 50.0,
                        activeFillColor: context.colorScheme.tertiary,
                        inactiveColor: Color(0xFF696969).withOpacity(0.25),
                        activeColor: context.colorScheme.tertiary,
                        selectedColor: Color(0xFF696969).withOpacity(0.25),
                      ),
                      scrollPadding: EdgeInsets.zero,
                      // onEditingComplete: () {
                      //   verificationCodeController.clear();
                      //   focusNode.unfocus();
                      // },
                      //  onCompleted: (_) => _register(),
                    ),
                    context.sizedBox(height: 109),
                    FAButton(
                      onPressed: () {},
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
