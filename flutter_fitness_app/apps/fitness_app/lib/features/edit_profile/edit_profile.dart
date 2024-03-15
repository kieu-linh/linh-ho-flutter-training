import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/form.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding(
            horizontal: 20, top: MediaQuery.paddingOf(context).top + 6),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FATopNavigation(
                  onLeadingPress: () =>
                      context.go(AppRoutes.profileScreen.path),
                  padding: const EdgeInsets.only(top: 2),
                  title: 'EDIT PROFILE',
                ),
                SizedBox(height: 18),
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(FAImage.imgAvatar),
                ),
                SizedBox(height: 14),
                Form(
                    child: Column(
                  children: [
                    FAInput(
                      //readOnly: state.status == SubmissionStatus.loading,
                      hintText: context.l10n.fullNameText,
                      validator: (value) => FAValidator.validatorInput(value),
                    ),
                    EmailInput(),
                    FAInput(
                      hintText: 'Weight',
                      validator: (value) => FAValidator.validatorInput(value),
                    ),
                    FAInput(
                      hintText: 'Height',
                      validator: (value) => FAValidator.validatorInput(value),
                    ),
                    FAInput(
                      hintText: 'Height',
                      validator: (value) => FAValidator.validatorInput(value),
                    ),
                    FAInput(
                      hintText: 'Gender',
                      validator: (value) => FAValidator.validatorInput(value),
                    ),
                    FAInput(
                      hintText: 'Age',
                      validator: (value) => FAValidator.validatorInput(value),
                    ),
                    FAButton(
                      text: 'SAVE',
                      onPressed: () {},
                    ),
                    SizedBox(height: 32)
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
