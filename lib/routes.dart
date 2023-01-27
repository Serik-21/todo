import 'package:go_router/go_router.dart';
import 'package:todo/main.dart';
import 'package:todo/pages/todo_detail.dart';

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
