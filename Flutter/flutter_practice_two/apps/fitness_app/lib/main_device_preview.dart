import 'package:api_client/api_client.dart';
import 'package:device_preview/device_preview.dart';
import 'package:fitness_ui/core/theme/theme.dart';
import 'package:fitness_app/l10n/l10n_generated/l10n.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitness_app/features/auth/login/repositories/auth_repository.dart';
import 'package:fitness_app/features/category/repositories/category_repository.dart';
import 'package:fitness_app/features/exercise/repositories/exercise_repositories.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(
    DevicePreview(builder: (context) => const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient apiClient;

  @override
  void initState() {
    apiClient = ApiClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(apiClient),
          ),
          RepositoryProvider<CategoryRepository>(
            create: (context) => CategoryRepository(apiClient),
          ),
          RepositoryProvider<ExerciseRepository>(
            create: (context) => ExerciseRepository(apiClient),
          ),
          RepositoryProvider<HomeRepository>(
            create: (context) => HomeRepository(apiClient),
          ),
        ],
        child: MaterialApp.router(
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
        ));
  }
}
