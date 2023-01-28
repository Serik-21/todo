import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/routes.dart';
import 'package:todo/service_locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/stores/notification_manager.dart';
import 'package:todo/stores/todo_store.dart';
import 'color_schemes.g.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupSingleton();
  NotificationManager().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60)))),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60)))),
      routerConfig: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todoStore = serviceLocator<ToDoStore>();
  @override
  void initState() {
    super.initState();
    todoStore.init();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(),

      body: Observer(builder: (context) {
        return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ListView(
              shrinkWrap: true,
              children: [
                ...todoStore.todoList
                    .map((todo) => ListTile(
                          title: Text(todo.title!),
                          subtitle: todo.subTitle != null
                              ? Text(todo.subTitle!)
                              : null,
                        ))
                    .toList(),
              ],
            ));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        tooltip: 'add event',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
