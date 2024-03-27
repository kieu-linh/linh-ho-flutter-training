import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/change_password/bloc/change_pass_bloc.dart';
import 'package:fitness_app/features/change_password/bloc/change_pass_event.dart';
import 'package:fitness_app/features/change_password/bloc/change_pass_state.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePassBloc(context.read<ApiClient>()),
      child: BlocListener<ChangePassBloc, ChangePassState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          // if success show snackbar with message
          if (state.status == SubmissionStatus.success) {
            FASnackBar.success(context, message: 'Change password success!');
            context.go(AppRoutes.loginScreen.path);
          }
          // if failure show snackbar with error message
          else if (state.status == SubmissionStatus.failure) {
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
                            context.go(AppRoutes.drawerScreen.path),
                      ),
                      context.sizedBox(height: 30),
                      FAText.displayLarge(context,
                          text: context.l10n.changePass),
                      const SizedBox(height: 11),
                      Text(
                        context.l10n.descriptionForgotPass,
                        style: context.textTheme.headlineMedium,
                      ),
                      context.sizedBox(height: 99),
                      BlocBuilder<ChangePassBloc, ChangePassState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) => FAPasswordInput(
                          onChanged: (currentPassword) => context
                              .read<ChangePassBloc>()
                              .add(CurrentPassChanged(
                                currentPassword: currentPassword,
                              )),
                          hintText: 'Current Password',
                          validator: FAValidator.validatorPassword,
                          readOnly: state.status == SubmissionStatus.loading,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      BlocBuilder<ChangePassBloc, ChangePassState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status ||
                            previous.isValid != current.isValid,
                        builder: (context, state) => FAPasswordInput(
                          onChanged: (newPass) =>
                              context.read<ChangePassBloc>().add(NewPassChanged(
                                    newPassword: newPass,
                                  )),
                          hintText: 'New Password',
                          validator: FAValidator.validatorPassword,
                          readOnly: state.status == SubmissionStatus.loading,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      BlocBuilder<ChangePassBloc, ChangePassState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status ||
                            previous.isValid != current.isValid,
                        builder: (context, state) => FAPasswordInput(
                          onFieldSubmit: state.isValid
                              ? (value) {
                                  context.read<ChangePassBloc>().add(
                                        ChangePassSubmitted(
                                          currentPassword:
                                              state.currentPassword,
                                          newPassword: state.newPassword,
                                        ),
                                      );
                                }
                              : null,
                          onChanged: (confirmPassword) => context
                              .read<ChangePassBloc>()
                              .add(ConfirmPasswordChanged(
                                confirmPassword: confirmPassword,
                              )),
                          hintText: 'Confirm Password',
                          readOnly: state.status == SubmissionStatus.loading,
                          validator: (value) {
                            return FAValidator.validatorConfirmPassword(
                                value, state.newPassword);
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      context.sizedBox(height: 109),
                      BlocBuilder<ChangePassBloc, ChangePassState>(
                        builder: (context, state) {
                          return FAButton(
                            onPressed: state.isValid
                                ? () {
                                    context.read<ChangePassBloc>().add(
                                          ChangePassSubmitted(
                                            currentPassword:
                                                state.currentPassword,
                                            newPassword: state.newPassword,
                                          ),
                                        );
                                  }
                                : null,
                            text: context.l10n.changePass,
                            color: state.isValid
                                ? context.colorScheme.primary
                                : context.colorScheme.outlineVariant,
                            isLoading: state.status == SubmissionStatus.loading,
                          );
                        },
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
