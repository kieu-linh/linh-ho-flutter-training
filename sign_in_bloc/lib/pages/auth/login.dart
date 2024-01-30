// ignore_for_file: directives_ordering, inference_failure_on_instance_creation
import 'package:flutter/material.dart';
import 'package:sign_in_bloc/core/typography/text_style.dart';
import 'package:sign_in_bloc/pages/auth/auth_validator.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/presentation/button.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/presentation/input.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/presentation/top_navigation.dart';
import 'package:sign_in_bloc/pages/home_page.dart';

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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
    //GoRouter.of(context).go('/favoriteScreen');
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
                  FATopNavigation(onLeadingPress: () {}),
                  const SizedBox(height: 30),
                  Text('Welcome to Pro Fitness!',
                      style: AppTextStyles.titlePrimary),
                  const SizedBox(height: 11),
                  Text(
                    'Hello there, sign in to \ncontinue!',
                    style: AppTextStyles.headlineMedium,
                  ),
                  const SizedBox(height: 39),
                  FAInput(
                    onChanged: _checkValidatorEmail,
                    controller: emailController,
                    hintText: 'Email Address',
                    //icon: checkIcon ? FAIcons.iconTick : null,
                    validator: (value) {
                      return FAValidator.validatorEmail(
                        value,
                        check: checkIcon,
                      );
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 14),
                  FAInput(
                    controller: passwordController,
                    hintText: 'Password',
                    //icon: FAIcons.iconEye,
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
                        'Forgot Password?',
                        style: AppTextStyles.textTitle,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  FAButton(
                    onPressed: _submitLogin,
                    text: 'Login',
                    isDisable: isLoading,
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
