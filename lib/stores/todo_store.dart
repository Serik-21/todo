
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/event_model.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:todo/service_locator.dart';
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

  @observable
  List<ToDo> doneTodoList = [];

  @observable
  List<ToDo> archiveTodoList = [];

  @action
  Future<void> init()async{
    final prefs = await SharedPreferences.getInstance();
    tz.initializeTimeZones();

    if(prefs.getString(kDefaultListKey)!= null) {
      Iterable l = jsonDecode(prefs.getString(kDefaultListKey)!);
      todoList = List<ToDo>.from(l.map((model)=> ToDo.fromJson(model)));
    }
    if(prefs.getString(kDefaultArchivedListKey)!= null) {
      Iterable l = jsonDecode(prefs.getString(kDefaultArchivedListKey)!);
      archiveTodoList = List<ToDo>.from(l.map((model)=> ToDo.fromJson(model)));
    }    if(prefs.getString(kDefaultDoneListKey)!= null) {
      Iterable l = jsonDecode(prefs.getString(kDefaultDoneListKey)!);
      doneTodoList = List<ToDo>.from(l.map((model)=> ToDo.fromJson(model)));
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
  Future deleteActiveTodo(ToDo value)async {
    todoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
    todoList = todoList;
  }
  @action
  Future deleteDoneTodo(ToDo value)async {
    doneTodoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultDoneListKey, jsonEncode(doneTodoList));
    doneTodoList = doneTodoList;
  }
  @action
  Future deleteArchiveTodo(ToDo value)async {
    archiveTodoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultArchivedListKey, jsonEncode(archiveTodoList));
    archiveTodoList = archiveTodoList;
  }
  @action
  Future archiveTodo(ToDo value)async{
    ToDo temp = todoList.where((element) => element == value).single;
    archiveTodoList.add(temp);
    todoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultArchivedListKey, jsonEncode(archiveTodoList));
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
    todoList = todoList;
    archiveTodoList = archiveTodoList;
  }


  @action
  Future doneTodo(ToDo value)async{
    ToDo temp = todoList.where((element) => element == value).single;
    doneTodoList.add(temp);
    todoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultDoneListKey, jsonEncode(doneTodoList));
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
    todoList = todoList;
    doneTodoList = doneTodoList;
  }
  @action
  Future returnToTodo(ToDo value)async{
    ToDo temp = doneTodoList.where((element) => element == value).single;
    todoList.add(temp);
    doneTodoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
    prefs.setString(kDefaultDoneListKey, jsonEncode(doneTodoList));
    todoList = todoList;
    doneTodoList = doneTodoList;
  }
  @action
  Future returnTodoFromArchive(ToDo value)async{
    ToDo temp = archiveTodoList.where((element) => element == value).single;
    todoList.add(temp);
    archiveTodoList.removeWhere((element) => element == value);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
    prefs.setString(kDefaultArchivedListKey, jsonEncode(archiveTodoList));
    todoList = todoList;
    archiveTodoList = archiveTodoList;
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
    logger.w(selectedTodo!.fromDate!);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(kDefaultListKey, jsonEncode(todoList));
  }
}
