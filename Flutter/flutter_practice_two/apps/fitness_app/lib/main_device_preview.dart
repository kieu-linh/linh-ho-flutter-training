import 'package:device_preview/device_preview.dart';
import 'package:fitness_ui/core/theme/theme.dart';
import 'package:fitness_app/l10n/l10n_generated/l10n.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(
    DevicePreview(builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // ignore: avoid_redundant_argument_values
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: FAppTheme.lightTheme,
      localizationsDelegates: const [
        FAUiS.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        ...S.delegate.supportedLocales,
        ...FAUiS.delegate.supportedLocales,
        const Locale('en', ''),
      ],
      routerConfig: FARouter.appRouter,
    );
  }
}
