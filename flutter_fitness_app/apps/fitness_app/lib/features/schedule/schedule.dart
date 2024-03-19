import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/components/switch.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    super.key,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  /// create date time variable
  DateTime _dateTime = DateTime.now();

  TimeOfDay _time = TimeOfDay.now();

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

  /// show date picker method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/img_schedule.png',
                width: context.width,
                height: context.sizeHeight(379),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              child: FATopNavigation(
                onLeadingPress: () =>
                    context.goNamed(AppRoutes.exerciseDetailScreen.name),
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  ' SCHEDULE EXERCISE',
                                  style:
                                      context.textTheme.displaySmall?.copyWith(
                                    color: context.colorScheme.tertiary,
                                  ),
                                ),
                                Spacer(),
                                FAIcons.close(),
                              ],
                            ),
                            context.sizedBox(height: 30),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _showDatePicker,
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_calendar.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Text('Date',
                                    style: context.textTheme.labelSmall),
                                Spacer(),
                                Row(
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      context.sizedBox(height: 20),
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
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  FAIcon.iconClock,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(width: 7),
                                Text('Time',
                                    style: context.textTheme.labelSmall),
                                Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    final TimeOfDay? timeOfDay =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: _time,
                                      initialEntryMode:
                                          TimePickerEntryMode.dial,
                                    );
                                    if (timeOfDay != null)
                                      setState(() {
                                        _time = timeOfDay;
                                      });
                                  },
                                  child: Container(
                                    height: 42.0,
                                    width: 124.0,
                                    decoration: BoxDecoration(
                                      color: context
                                          .colorScheme.onSurfaceVariant
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            ' ${_time.format(context)}',
                                            style: context.textTheme.labelSmall,
                                          ),
                                          Spacer(),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            context.sizedBox(height: 40),
                            Row(
                              children: [
                                FAIcons.notification(
                                  color: context.colorScheme.tertiary,
                                ),
                                SizedBox(width: 7),
                                Text('Set Reminder',
                                    style: context.textTheme.labelSmall),
                              ],
                            ),
                            SizedBox(height: 14),
                            Row(
                              children: [
                                Text('Reminder on',
                                    style: context.textTheme.titleLarge),
                                Spacer(),
                                FASwitch(),
                              ],
                            ),
                            Padding(
                              padding: context.padding(top: 20, bottom: 20),
                              child: FAButton(
                                text: 'DONE',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
