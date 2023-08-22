import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';

@singleton
class AuthService {
  AuthService() {
    auth.FirebaseAuth.instance.authStateChanges().listen((auth.User? firebaseUser) {
      if (firebaseUser != null) {
        runInAction(() => user.value = User(
              id: firebaseUser.uid,
              name: firebaseUser.displayName ?? '',
              email: firebaseUser.email,
            ));
      } else {
        runInAction(() => user.value = null);
      }
    });
  }

  /// Updated with the currently logged in user details.
  /// `null` if the user is not logged in.
  Observable<User?> user = Observable<User?>(null);
}
