import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/form.dart';
import 'package:fitness_app/features/home/bloc/home_bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/constant/images.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  };
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  String selectedValue = 'Female';
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  Future<void> _submitSave() async {
    if (formKey.currentState!.validate() == false) return;
    setState(() => isLoading = true);
    User user = User(
        name: nameController.text,
        email: emailController.text,
        weight: double.parse(weightController.text),
        height: double.parse(heightController.text),
        gender: selectedValue == 'Female',
        age: int.parse(ageController.text));

    ApiClient()
        .patch(
          endpoint: '/User?email=eq.${user.email}',
          body: jsonEncode(user.toJsonProfile()),
        )
        .then((response) => print(response.statusCode))
        .catchError((onError) {
      SnackBar(content: Text(onError.toString()));
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() => isLoading = false);
    FASnackBar.success(context, message: 'Update success!');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeRepository(context.read<ApiClient>()))
        ..add(HomeFetchUserData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          nameController.text = state.user?.name ?? '';
          emailController.text = state.user?.email ?? '';
          weightController.text = '${state.user?.weight}';
          heightController.text = '${state.user?.height}';
          ageController.text = '${state.user?.age}';
          selectedValue = (state.user?.gender ?? false) ? 'Female' : 'Male';
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: context.padding(
                  horizontal: 20, top: MediaQuery.paddingOf(context).top + 6),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                        backgroundImage:
                            AssetImage(state.user?.avatar ?? FAImage.imgAvatar),
                      ),
                      SizedBox(height: 14),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            FAInput(
                              hintText: context.l10n.fullNameText,
                              controller: nameController,
                              validator: FAValidator.validatorInput,
                              onChanged: (p0) {
                                context.read<HomeBloc>().add(
                                      ProfileSubmit(
                                        name: nameController.text,
                                        weight:
                                            double.parse(weightController.text),
                                        height:
                                            double.parse(heightController.text),
                                        age: int.parse(ageController.text),
                                        gender: selectedValue == ' Female',
                                      ),
                                    );
                              },
                            ),
                            EmailInput(
                              controller: emailController,
                              readOnly: true,
                            ),
                            FAInput(
                              controller: weightController,
                              hintText: 'Weight',
                              validator: FAValidator.validatorWeight,
                              onChanged: (p0) {
                                context.read<HomeBloc>().add(
                                      ProfileSubmit(
                                        name: nameController.text,
                                        weight:
                                            double.parse(weightController.text),
                                        height:
                                            double.parse(heightController.text),
                                        age: int.parse(ageController.text),
                                        gender: selectedValue == ' Female',
                                      ),
                                    );
                              },
                            ),
                            FAInput(
                              controller: heightController,
                              hintText: 'Height',
                              validator: FAValidator.validatorHeight,
                              onChanged: (p0) {
                                context.read<HomeBloc>().add(
                                      ProfileSubmit(
                                        name: nameController.text,
                                        weight:
                                            double.parse(weightController.text),
                                        height:
                                            double.parse(heightController.text),
                                        age: int.parse(ageController.text),
                                        gender: selectedValue == ' Female',
                                      ),
                                    );
                              },
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
                                  color: context.colorScheme.outline
                                      .withOpacity(0.25),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: DropdownButton(
                                  value: selectedValue,
                                  onChanged: (value) {
                                    selectedValue = value.toString();
                                    context.read<HomeBloc>().add(
                                          ProfileSubmit(
                                            name: nameController.text,
                                            weight: double.parse(
                                                weightController.text),
                                            height: double.parse(
                                                heightController.text),
                                            age: int.parse(ageController.text),
                                            gender: selectedValue == ' Female',
                                          ),
                                        );
                                    setState(() {});
                                  },
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  items: itemIcons.keys
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                              controller: ageController,
                              hintText: 'Age',
                              validator: FAValidator.validatorAge,
                              onChanged: (p0) {
                                context.read<HomeBloc>().add(
                                      ProfileSubmit(
                                        name: nameController.text,
                                        weight:
                                            double.parse(weightController.text),
                                        height:
                                            double.parse(heightController.text),
                                        age: int.parse(ageController.text),
                                        gender: selectedValue == ' Female',
                                      ),
                                    );
                              },
                            ),
                            FAButton(
                              text: 'SAVE',
                              isLoading: isLoading,
                              color: state.isValidProfile
                                  ? context.colorScheme.primary
                                  : context.colorScheme.outlineVariant,
                              onPressed: _submitSave,
                            ),
                            SizedBox(height: 32)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
