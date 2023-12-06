import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_bottom.dart';
import 'package:flutter_application_1/components/custom_text_field.dart';
import 'package:flutter_application_1/components/custom_textfield_password.dart';
import 'package:svg_flutter/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static List<SvgPicture> linkIcons = [
    SvgPicture.asset(
      'assets/icons/apple.svg',
      width: 22.0,
      height: 22.0,
    ),
    SvgPicture.asset(
      'assets/icons/google.svg',
      width: 22.0,
      height: 22.0,
    ),
    SvgPicture.asset(
      'assets/icons/facebook.svg',
      width: 22.0,
      height: 22.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0)
                    .copyWith(top: MediaQuery.of(context).padding.top + 58.0),
                child: Column(children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Log into \nyour account',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email address',
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  CustomTextFieldPassword(
                    controller: passwordController,
                    hintText: 'Password',
                    action: TextInputAction.done,
                  ),
                  const SizedBox(height: 28.0),
                  GestureDetector(
                    onTap: () {},
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot password?',
                          style: TextStyle(fontSize: 12.0)),
                    ),
                  ),
                  const SizedBox(height: 35.0),
                  CustomButton.small(onPressed: () {}, text: 'Login'),
                  const SizedBox(height: 22.0),
                  const Text(
                    'or log in with',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  const SizedBox(height: 35.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        linkIcons.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xffE2E0DE),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 120.0),
                  RichText(
                    text: TextSpan(
                        text: 'Don’t have an account?',
                        style: TextStyle(fontSize: 14.0),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: ' Sign up',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ]),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
