import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../service_locator.dart';
import '../stores/todo_store.dart';

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
                    .map((todo) => Slidable(
                          child: ListTile(
                            title: Text(todo.title!),
                            subtitle: todo.subTitle != null
                                ? Text(todo.subTitle!)
                                : null,
                          ),
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
