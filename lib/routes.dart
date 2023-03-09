import 'package:go_router/go_router.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/todo_detail.dart';
//создание путей для работы с АПП
GoRouter routes = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
        routes: [
          GoRoute(
            path: "add",
            builder: (context, state) => const ToDoDetails(),
          ),
        ]),
  ],
);
