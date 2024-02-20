// ignore_for_file: depend_on_referenced_packages
import 'package:fitness_widgetbook/main.directories.g.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/card.dart';
import 'package:fitness_ui/components/carousel.dart';
import 'package:fitness_ui/components/input.dart';
import 'package:fitness_ui/components/input_password.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_ui/components/search_box.dart';
import 'package:fitness_ui/components/snack_bar.dart';
import 'package:fitness_ui/components/input_body_measurements.dart';
import 'package:fitness_ui/components/loading_indicator.dart';
import 'package:fitness_ui/components/bottom_navigation_bar.dart';
import 'package:fitness_ui/components/rich_text.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/components/app_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/typography/text_style.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:fitness_app/core/theme/theme.dart';

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
          designSize: const Size(375, 400),
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
  return SingleChildScrollView(
    child: Column(
      children: [
        appColor(text: 'primary', color: context.colorScheme.primary),
        appColor(text: 'secondary', color: context.colorScheme.secondary),
        appColor(text: 'onSecondary', color: context.colorScheme.onSecondary),
        appColor(text: 'tertiary', color: context.colorScheme.tertiary),
        appColor(
            text: 'tertiaryContainer',
            color: context.colorScheme.tertiaryContainer),
        appColor(text: 'surface', color: context.colorScheme.surface),
        appColor(text: 'onSurface', color: context.colorScheme.onSurface),
        appColor(
            text: 'onSurfaceVariant',
            color: context.colorScheme.onSurfaceVariant),
        appColor(text: 'outline', color: context.colorScheme.outline),
        appColor(
            text: 'outlineVariant', color: context.colorScheme.outlineVariant),
        appColor(text: 'error', color: context.colorScheme.error),
        appColor(text: 'onError', color: context.colorScheme.onError),
        appColor(
            text: 'inverseSurface', color: context.colorScheme.inverseSurface),
        appColor(
            text: 'onInverseSurface',
            color: context.colorScheme.onInverseSurface),
        appColor(
            text: 'inversePrimary', color: context.colorScheme.inversePrimary),
        appColor(
            text: 'onTertiaryContainer',
            color: context.colorScheme.onTertiaryContainer),
        appColor(text: 'surfaceTint', color: context.colorScheme.surfaceTint),
        appColor(text: 'iconColor', color: context.colorScheme.background),
        appColor(text: 'onIconColor', color: context.colorScheme.onBackground),
      ],
    ),
  );
}

// ignore: camel_case_types
class appColor extends StatelessWidget {
  const appColor({
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
                border: Border.all()),
            child: const SizedBox.square(dimension: 20),
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

@widgetbook.UseCase(
  name: 'Text',
  type: Typography,
)
Widget textHome(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FARichText(
              fistText: 'Welcome to'.toUpperCase(),
              secondText: ' Fitness App'.toUpperCase()),
          const SizedBox(height: 5),
          FAText.displayLarge(context, text: 'Welcome to Fitness App'),
          FAText.displayMedium(context, text: 'Welcome to Fitness App'),
          const SizedBox(height: 5),
          FAText.displaySmall(context, text: 'Welcome to Fitness App'),
          const SizedBox(height: 5),
          FAText.headlineLarge(context, text: 'Welcome to Fitness App'),
          const SizedBox(height: 5),
          FAText.headlineMedium(context, text: 'Welcome to Fitness App'),
          const SizedBox(height: 5),
          FAText.headlineSmall(context, text: 'Welcome to Fitness App'),
          const SizedBox(height: 5),
          FAText.bodyLarge(context, text: 'Welcome to Fitness App'),
          const SizedBox(height: 5),
          FAText.bodySmall(context, text: 'Welcome to Fitness App'),
        ],
      ),
    ),
  );
}

/// Widgetbook Bottom Navigation Bar
@widgetbook.UseCase(name: 'Bottom Navigation Bar', type: FABottomNavigationBar)
Scaffold bottomNavigationBar(BuildContext context) {
  return const Scaffold(body: FABottomNavigationBar());
}

/// Loading Indicator
@widgetbook.UseCase(
  name: 'Loading Indicator',
  type: FALoadingIndicator,
)
Center loadingIndicator(BuildContext context) {
  return Center(
    child: Container(
      height: 55,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.primary,
      ),
      child: FALoadingIndicator(
        textColor: context.colorScheme.secondary,
      ),
    ),
  );
}

/// Loading Indicator
@widgetbook.UseCase(
  name: 'Carousel',
  type: FACarousel,
)
Center carousel(BuildContext context) {
  return Center(child: FACarousel(onSkip: () {}, onNext: () {}));
}

/// Input Email
@widgetbook.UseCase(
  name: 'Input',
  type: FAInput,
)
Center input(BuildContext context) {
  final s = FAUiS.of(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FAInput(
            hintText: s.hintTextEmail,
            icon: FAIcons.iconTick,
            validator: (value) {
              return FAValidator.validatorEmail(value);
            },
          ),
          const SizedBox(height: 10),
          FAInputPassword(
            hintText: s.hintTextPassword,
            obscureText: true,
            validator: FAValidator.validatorPassword,
          ),
        ],
      ),
    ),
  );
}

/// Search Box
@widgetbook.UseCase(
  name: 'Search Box',
  type: FASearchBox,
)
Center searchBox(BuildContext context) {
  return const Center(
    child: FASearchBox(),
  );
}

/// Snack Bar Success
@widgetbook.UseCase(
  name: 'Snack Bar Success',
  type: FASnackBar,
)
snackBarSuccess(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        FASnackBar.success(context, message: 'SUCCESS!!!!');
      },
      child: const Text('Show snackbar success!'));
}

/// Snack Bar Error
@widgetbook.UseCase(
  name: 'Snack Bar Error',
  type: FASnackBar,
)
snackBarError(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        FASnackBar.success(context, message: 'SUCCESS!!!!');
      },
      child: const Text('Show snackbar error!'));
}

/// Input Body Measurements
@widgetbook.UseCase(
  name: 'Input Body Measurement',
  type: FABodyMeasurementInput,
)
Center inputBodyMeasurements(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FABodyMeasurementInput(
              textLeft: FAUiS.current.lbs, textRight: FAUiS.current.kg),
        ],
      ),
    ),
  );
}
