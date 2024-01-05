// ignore_for_file: depend_on_referenced_packages
import 'package:fitness_widgetbook/widgetbook/main.directories.g.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/card.dart';
//import 'package:fitness_ui/components/app_bar.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/core/extension/extension.dart';
//import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const FAWidgetBook());
}

@widgetbook.App()
class FAWidgetBook extends StatelessWidget {
  const FAWidgetBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        ),
        TextScaleAddon(
          scales: [1.0, 2.0],
          initialScale: 1,
        ),
        LocalizationAddon(
          locales: [
            const Locale('en', 'vn'),
          ],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
          ],
        ),
        TimeDilationAddon(),
        AlignmentAddon(
          initialAlignment: Alignment.center,
        ),
      ],
      appBuilder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: child,
            );
          },
          child: child,
        );
      },
    );
  }
}

@widgetbook.UseCase(
  name: 'Welcome Screen Button',
  type: FAButton,
)
Widget primaryButton(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(29),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FAButton(
            onPressed: () {},
            text: 'NEXT STEPS',
          ),
          const SizedBox(height: 20),
          FAButton.outline(
            onPressed: () {},
            icon: FAIcons.iconGainMuscle,
            iconColor: context.colorScheme.secondary,
            color: Colors.black,
            textStyle: AppTextStyles.textButtonGoal
                .copyWith(color: context.colorScheme.onSecondary),
            text: 'Gain muscle',
          ),
          const SizedBox(height: 20),
          FAButton.outline(
            onPressed: () {},
            icon: FAIcons.iconGoogle,
            text: 'Connect with Google',
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'CardHome',
  type: FACard,
)
Center cardHome(BuildContext context) {
  return const Center(child: FACard());
}
