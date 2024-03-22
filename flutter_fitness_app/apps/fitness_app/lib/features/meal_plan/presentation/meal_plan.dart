import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/home/model/meal.dart';
import 'package:fitness_app/features/meal_plan/bloc/meal_bloc.dart';
import 'package:fitness_app/features/meal_plan/bloc/meal_event.dart';
import 'package:fitness_app/features/meal_plan/bloc/meal_state.dart';
import 'package:fitness_app/features/meal_plan/repository/meal_repository.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/divider.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/shimmer.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MealPlanPage extends StatefulWidget {
  const MealPlanPage({super.key});

  @override
  State<MealPlanPage> createState() => _MealPlanPageState();
}

class _MealPlanPageState extends State<MealPlanPage> {
  DateTime _dateTime = DateTime.now();

  var monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    List<Meal> listMeal = [];
    return BlocProvider(
        create: (context) => MealBloc(
            repository: MealRepository(apiClient: context.read<ApiClient>()))
          ..add(FetchMealData())
          ..add(FetchMealDetailData()),
        child: BlocConsumer<MealBloc, MealState>(
          listener: (context, state) {
            if (state.mealDetails.isNotEmpty) {
              listMeal = state.meals.where((e) {
                return e.mealDetail?.mealDetailID ==
                    state.mealDetails[state.index].mealDetailID;
              }).toList();
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      FATopNavigation(
                        title: 'MEAL PLAN',
                        onLeadingPress: () =>
                            context.go(AppRoutes.homeScreen.path),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _dateTime = _dateTime.copyWith(
                                  month: _dateTime.month - 1,
                                );
                              });
                            },
                            child: FAIcons.back(),
                          ),
                          SizedBox(width: 25),
                          Column(
                            children: [
                              SizedBox(height: 20),
                              Text(
                                monthNames[_dateTime.month - 1],
                                style: context.textTheme.labelSmall,
                              ),
                              SizedBox(height: 5),
                              Text(
                                _dateTime.year.toString(),
                                style: context.textTheme.bodySmall,
                              )
                            ],
                          ),
                          const SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _dateTime = _dateTime.copyWith(
                                  month: _dateTime.month + 1,
                                );
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/icons/ic_next.svg',
                            ),
                          ),
                        ],
                      ),
                      context.sizedBox(height: 25),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: context.padding(horizontal: 20),
                          child: Row(
                            children: List.generate(7, (index) {
                              return Padding(
                                padding: context.padding(right: 19),
                                child: Container(
                                  height: context.sizeHeight(80),
                                  width: context.sizeWidth(50),
                                  decoration: BoxDecoration(
                                      color: index == 0
                                          ? context.colorScheme.tertiary
                                          : context.colorScheme.onSurfaceVariant
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Column(children: [
                                    Spacer(),
                                    Text(
                                      '${DateFormat('E').format(_dateTime.subtract(Duration(days: -index)))}',
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                              color: index == 0
                                                  ? context
                                                      .colorScheme.secondary
                                                  : context
                                                      .colorScheme.surface),
                                    ),
                                    SizedBox(height: 12.0),
                                    CircleAvatar(
                                      backgroundColor:
                                          context.colorScheme.secondary,
                                      radius: 15.0,
                                      child: Text(
                                        '${DateFormat('d').format(_dateTime.subtract(Duration(days: -index)))}',
                                        style: context.textTheme.labelSmall,
                                      ),
                                    ),
                                    Spacer(),
                                  ]),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      context.sizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            List.generate(state.mealDetails.length, (index) {
                          return GestureDetector(
                            onTap: () => context
                                .read<MealBloc>()
                                .add(MealOnTap(index: index)),
                            child: Container(
                              margin: const EdgeInsets.only(right: 13),
                              padding:
                                  context.padding(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: state.index == index
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onSurfaceVariant
                                        .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                state.mealDetails[index].name ?? '',
                                style: state.index == index
                                    ? context.textTheme.labelMedium?.copyWith(
                                        color: context.colorScheme.secondary,
                                      )
                                    : context.textTheme.labelMedium,
                              ),
                            ),
                          );
                        }),
                      ),
                      context.sizedBox(height: 30),
                      BlocBuilder<MealBloc, MealState>(
                        builder: (context, state) {
                          switch (state.fetchMealStatus) {
                            case SubmissionStatus.initial:
                              return SizedBox(height: 32);
                            case SubmissionStatus.loading:
                              return FAShimmer.meal();
                            case SubmissionStatus.success:
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final meal = listMeal[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(meal.imagePath ?? '',
                                          fit: BoxFit.contain),
                                      const SizedBox(height: 11),
                                      FAText.bodySmall(context,
                                          text: meal.description ?? ''),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          FAIcons.calories(),
                                          const SizedBox(width: 7),
                                          Text(
                                            '${meal.kcal} kcal',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const FADivider(
                                  height: 41,
                                  endIndent: 0,
                                  indent: 0,
                                ),
                                itemCount: listMeal.length,
                              );
                            case SubmissionStatus.failure:
                              return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
