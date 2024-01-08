// ignore_for_file: depend_on_referenced_packages
import 'package:fitness_widgetbook/widgetbook/main.directories.g.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:fitness_ui/components/app_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/core/extension/extension.dart';
//import 'package:flutter_practice_one/data/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter_practice_one/core/theme/theme.dart';
import 'package:flutter_practice_one/data/models/user_data.dart';

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
              data: FAppTheme.lightTheme,
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
            ...FAUiS.delegate.supportedLocales,
            const Locale('en', 'vn'),
          ],
          localizationsDelegates: [
            FAUiS.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
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
            textStyle: null,
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
  name: 'AppBar',
  type: FAAppBar,
)
Scaffold appBar(BuildContext context) {
  return Scaffold(
    appBar: FAAppBar(
      onPressed: () {},
      user: user1,
    ),
  );
}

@widgetbook.UseCase(
  name: 'CardHome',
  type: FACard,
)
Widget cardHome(BuildContext context) {
  return const Center(child: FACard());
}

@widgetbook.UseCase(
  name: 'SurfaceThemeData',
  type: Container,
)
Widget colorAppThemeData(BuildContext context) {
  return Column(
    children: [
      colorContainer(
        text: 'Primary',
        color: context.colorScheme.primary,
      ),
    ],
  );
}

class colorContainer extends StatelessWidget {
  const colorContainer({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
                border: Border.all()),
            child: const SizedBox.square(dimension: 25),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: context.colorScheme.tertiary),
          )
        ],
      ),
    );
  }
}
