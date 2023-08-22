import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'services/auth_service.dart';

@singleton
class AppRouter {
  AppRouter({
    required this.authService,
  });

  final AuthService authService;

  void goToHome(BuildContext context) {
    context.go('/');
  }

  late final goRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (authService.user.value == null) {
        return '/login';
      } else {
        return null;
      }
    },
  );
}
