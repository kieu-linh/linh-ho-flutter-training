import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/features/auth/sign_in/repository/auth_repository.dart';
import 'package:fitness_ui/core/theme/theme.dart';
import 'package:fitness_app/l10n/l10n_generated/l10n.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(apiClient),
          ),
          RepositoryProvider<ApiClient>(
            create: (context) => ApiClient(),
          ),
          RepositoryProvider<SharedPrefs>(
            create: (context) => SharedPrefs(SharedPreferences.getInstance()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
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
