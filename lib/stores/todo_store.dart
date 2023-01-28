
import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/event_model.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:todo/stores/notification_manager.dart';
import '../assets.dart';
part 'todo_store.g.dart';

class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store {
  _ToDoStore();

  @observable
  ToDo? selectedTodo = ToDo();

  @observable
  List<ToDo> todoList = [];

  @action
  Future<void> init()async{
    final prefs = await SharedPreferences.getInstance();
    tz.initializeTimeZones();

    if(prefs.getString(kDefaultListKey)!= null) {
      Iterable l = jsonDecode(prefs.getString(kDefaultListKey)!);
      todoList = List<ToDo>.from(l.map((model)=> ToDo.fromJson(model)));
    }

  }

  @action
  void setTitle(String value) {
    final temp = selectedTodo!;
    temp.title = value;
    selectedTodo = temp;
  }

  @action
  void setSubTitle(String value) {
    final temp = selectedTodo!;
    temp.subTitle = value;
    selectedTodo = temp;
  }

  @action
  void setUserTag(String value) {
    final temp = selectedTodo!;
    temp.userTag = value;
    selectedTodo = temp;
  }

  @action
  void setFromDate(DateTime value) {
    final temp = selectedTodo!;
    temp.fromDate = value;
    selectedTodo = temp;
  }

  @action
  void setToDue(DateTime value) {
    final temp = selectedTodo!;
    temp.dueDate = value;

    selectedTodo = temp;
  }
  @action
  void setTime(String value) {
    final temp = selectedTodo!;
    temp.time = value;

    selectedTodo = temp;
  }

  @action
  Future<void> addTodoToList()async {
    ToDo toDo = ToDo(
      title: selectedTodo!.title,
      subTitle: selectedTodo!.subTitle,
      userTag: selectedTodo!.userTag,
      fromDate: selectedTodo!.fromDate,
      dueDate: selectedTodo!.dueDate,
      time: selectedTodo!.time,
      description: selectedTodo!.description

    );
    todoList.add(toDo);
    NotificationManager().showNotification(
        1, toDo.title!, toDo.subTitle!);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
  }
}
