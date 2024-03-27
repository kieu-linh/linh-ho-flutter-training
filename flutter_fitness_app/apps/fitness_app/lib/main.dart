import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/notification/local_notifications.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/features/auth/sign_in/repository/auth_repository.dart';
import 'package:fitness_ui/core/theme/theme.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService().initialize();
  await _configureLocalTimeZone();

  runApp(const MyApp());
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
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
        theme: FAppTheme.lightTheme,
        // darkTheme: FAppTheme.darkTheme,
        localizationsDelegates: const [
          FAUiS.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: FAUiS.delegate.supportedLocales,
        locale: const Locale('en'),
        routerConfig: FARouter.appRouter,
      ),
    );
  }
}
