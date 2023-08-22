import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/config.dart';
import 'firebase/firebase_options.dart';
import 'injection.dart';
import 'messages.dart';
import 'router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: EnvironmentDefaultFirebaseOptions.forCurrentPlatform,
  );
  configureDependencies();

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(
      clientId: getIt<Config>().googleClientId,
    ),
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppMessages.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      onGenerateTitle: (context) => getIt<Config>().appNamePrefix + Messages.of(context)!.title,
      routerConfig: getIt<AppRouter>().goRouter,
    );
  }
}
