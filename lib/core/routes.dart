import 'package:go_router/go_router.dart';
import 'package:todo_app/auth/login/login_screen.dart';
import 'package:todo_app/auth/register/register_screen.dart';
import 'package:todo_app/home/home_screen.dart';

class RoutesName {
  static const String login = '/';
  static const String register = "register";
  static const String homescreen = "homescreen";
}

class AppRoutes {
  static GoRouter routers = GoRouter(routes: [
    GoRoute(
      name: RoutesName.login,
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: RoutesName.register,
      path: "/register",
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      name: RoutesName.homescreen,
      path: "/homescreen",
      builder: (context, state) => HomeScreen(),
    ),
  ]);
}
