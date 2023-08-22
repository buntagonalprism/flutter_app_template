import 'package:firebase_core/firebase_core.dart';

import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;

class EnvironmentDefaultFirebaseOptions {
  static FirebaseOptions get forCurrentPlatform {
    const enviroment = String.fromEnvironment("firebaseEnvironment");
    return switch (enviroment) {
      "dev" => dev.DefaultFirebaseOptions.currentPlatform,
      "prod" => prod.DefaultFirebaseOptions.currentPlatform,
      _ => throw UnsupportedError("Unknown environment for firebase: $enviroment"),
    };
  }
}
