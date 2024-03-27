import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/auth/forget_password/bloc/forget_password_bloc.dart';
import 'package:fitness_app/features/auth/forget_password/bloc/forget_password_event.dart';
import 'package:fitness_app/features/auth/forget_password/bloc/forget_password_state.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/form.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPassBloc(context.read<ApiClient>()),
      child: BlocListener<ForgotPassBloc, ForgotPassState>(
        listener: (context, state) {
          if (state.status == SubmissionStatus.success) {
            context.go(AppRoutes.resetPassScreen.path);
          } else if (state.status == SubmissionStatus.failure) {
            FASnackBar.error(context, message: state.errorMessage);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: context.padding(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
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
                      BlocBuilder<ForgotPassBloc, ForgotPassState>(
                        buildWhen: (previous, current) =>
                            previous.isEmailValid != current.isEmailValid ||
                            previous.status != current.status,
                        builder: (context, state) => EmailInput(
                          onChanged: (email) => context
                              .read<ForgotPassBloc>()
                              .add(inputEmailChanged(email: email)),
                          isValid: state.isEmailValid,
                          readOnly: state.status == SubmissionStatus.loading,
                        ),
                      ),
                      context.sizedBox(height: 109),
                      BlocBuilder<ForgotPassBloc, ForgotPassState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) => FAButton(
                          onPressed: state.isValid
                              ? () => context
                                  .read<ForgotPassBloc>()
                                  .add(ForgotPassSubmitted(email: state.email))
                              : null,
                          text: 'RESET PASSWORD',
                          color: state.isValid
                              ? context.colorScheme.primary
                              : context.colorScheme.outlineVariant,
                          isLoading: state.status == SubmissionStatus.loading,
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
    );
  }
}
