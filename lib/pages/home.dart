import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/assets.dart';

import '../enums.dart';
import '../service_locator.dart';
import '../stores/todo_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todoStore = serviceLocator<ToDoStore>();
  ToDoStatusEnum? statusEnum;
  String title = "";
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    statusEnum = ToDoStatusEnum.actual;
    todoStore.init();
    title = "Нақты";
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.sort),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: ToDoStatusEnum.actual,
                    child: Text("Нақты"),
                  ),
                  const PopupMenuItem(
                    value: ToDoStatusEnum.done,
                    child: Text("Аяқталды"),
                  ),
                  const PopupMenuItem(
                    value: ToDoStatusEnum.archived,
                    child: Text("Мұрағат"),
                  )
                ];
              },
              onSelected: (value) {
                if (value == ToDoStatusEnum.actual) {
                  setState(() {
                    statusEnum = ToDoStatusEnum.actual;
                    title = "Нақты";
                  });
                } else if (value == ToDoStatusEnum.done) {
                  setState(() {
                    statusEnum = ToDoStatusEnum.done;
                    title = "Аяқталды";
                  });
                } else if (value == ToDoStatusEnum.archived) {
                  setState(() {
                    statusEnum = ToDoStatusEnum.archived;
                    title = "Мұрағат";
                  });
                }
              })
        ],
      ),

      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Observer(builder: (context) {
            return ListView(
              shrinkWrap: true,
              children: [

                //list today
                if (todoStore.todoList
                        .where((element) =>
                            dateTime.isSameDate(element.fromDate!))
                        .isNotEmpty &&
                    statusEnum == ToDoStatusEnum.actual)
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                     child: Text("Бүгінге",style: Theme.of(context).textTheme.titleLarge,),
                   ),
                //list today
                if (statusEnum == ToDoStatusEnum.actual)
                  ...todoStore.todoList
                      .where((element) => dateTime.isSameDate(element.fromDate!))
                      .map((todo) => Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (e) {
                                    todoStore.deleteActiveTodo(todo);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Жою',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    todoStore.archiveTodo(todo);
                                  },
                                  backgroundColor: const Color(0xFFFF771F),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Мұрағат',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    todoStore.doneTodo(todo);
                                  },
                                  backgroundColor: const Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.done_outline_rounded,
                                  label: 'Аяқталды',
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container();
                                  }),
                              title: Text(todo.title!),
                              trailing: Text(
                                  "${todo.time!}\n${DateFormat(kDefaultDataFormat).format(todo.fromDate!)}"),
                              subtitle: todo.subTitle != null
                                  ? Text(todo.subTitle!)
                                  : null,
                            ),
                          )),
                if(statusEnum == ToDoStatusEnum.actual)

                    const SizedBox(height: 4,),
                if(statusEnum == ToDoStatusEnum.actual)
                  const Divider(height: 2,),
                if(statusEnum == ToDoStatusEnum.actual)
                  const SizedBox(height: 4,),
                if(statusEnum == ToDoStatusEnum.actual)
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text("Барлық тапсырмалар",style: Theme.of(context).textTheme.titleLarge,),
                ),
                // list all
                  if (statusEnum == ToDoStatusEnum.actual)
                  ...todoStore.todoList
                      .where((element) =>
                          dateTime.isSameDate(element.fromDate!) == false)
                      .map((todo) => Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (e) {
                                    todoStore.deleteActiveTodo(todo);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Жою',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => todoStore.archiveTodo(todo),
                                  backgroundColor: const Color(0xFFFF771F),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Мұрағат',
                                ),
                                SlidableAction(
                                  onPressed: (context) {
                                    todoStore.doneTodo(todo);
                                  },
                                  backgroundColor: const Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.done_outline_rounded,
                                  label: 'Аяқталды',
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container();
                                  }),
                              title: Text(todo.title!),
                              trailing: Text(
                                  "${todo.time!}\n${DateFormat(kDefaultDataFormat).format(todo.fromDate!)}"),
                              subtitle: todo.subTitle != null
                                  ? Text(todo.subTitle!)
                                  : null,
                            ),
                          ))
                      .toList(),

                //done list
                if (statusEnum == ToDoStatusEnum.done)
                  ...todoStore.doneTodoList
                      .map((todo) => Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    todoStore.deleteDoneTodo(todo);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Жою',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    todoStore.returnToTodo(todo);

                                  },
                                  backgroundColor: const Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.done_outline_rounded,
                                  label: 'Тапсырмаларға оралу',
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container();
                                  }),
                              title: Text(todo.title!),
                              trailing: Text(
                                  "${todo.time!}\n${DateFormat(kDefaultDataFormat).format(todo.fromDate!)}"),
                              subtitle: todo.subTitle != null
                                  ? Text(todo.subTitle!)
                                  : null,
                            ),
                          ))
                      .toList(),
                if (statusEnum == ToDoStatusEnum.archived)
                  ...todoStore.archiveTodoList
                      .map((todo) => Slidable(
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) =>
                                      todoStore.deleteArchiveTodo(todo),
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Жою',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) =>
                                      todoStore.returnTodoFromArchive(todo),
                                  backgroundColor: const Color(0xFFFF771F),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Мұрағаттан жою',
                                ),
                              ],
                            ),
                            child: ListTile(
                              onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container();
                                  }),
                              title: Text(todo.title!),
                              trailing: Text(
                                  "${todo.time!}\n${DateFormat(kDefaultDataFormat).format(todo.fromDate!)}"),
                              subtitle: todo.subTitle != null
                                  ? Text(todo.subTitle!)
                                  : null,
                            ),
                          ))
                      .toList(),
              ],
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        tooltip: 'Тапсырма қосу',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
