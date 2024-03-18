// ignore_for_file: deprecated_member_use

import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/form.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final Map<String, String> itemIcons = {
    'Female': FAIcon.iconFemale,
    'Male': FAIcon.iconMale,
    'Other': '',
  };

  String selectedValue = 'Female';

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FAText.headlineMedium(
                          context,
                          text: 'Gender',
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: context.colorScheme.outline.withOpacity(0.25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: DropdownButton(
                          value: selectedValue,
                          onChanged: (value) {
                            selectedValue = value.toString();
                            setState(() {});
                          },
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          underline: SizedBox(),
                          items: itemIcons.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: <Widget>[
                                  SvgPicture.asset(
                                    itemIcons[value] ?? '',
                                    width: 20,
                                    height: 20,
                                    color: context.colorScheme.surface,
                                  ),
                                  SizedBox(width: 5), // Spacer
                                  Text(value), // Text
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
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
