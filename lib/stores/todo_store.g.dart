// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoStore on _ToDoStore, Store {
  late final _$selectedTodoAtom =
      Atom(name: '_ToDoStore.selectedTodo', context: context);

  @override
  ToDo? get selectedTodo {
    _$selectedTodoAtom.reportRead();
    return super.selectedTodo;
  }

  @override
  set selectedTodo(ToDo? value) {
    _$selectedTodoAtom.reportWrite(value, super.selectedTodo, () {
      super.selectedTodo = value;
    });
  }

  late final _$todoListAtom =
      Atom(name: '_ToDoStore.todoList', context: context);

  @override
  List<ToDo> get todoList {
    _$todoListAtom.reportRead();
    return super.todoList;
  }

  @override
  set todoList(List<ToDo> value) {
    _$todoListAtom.reportWrite(value, super.todoList, () {
      super.todoList = value;
    });
  }

  late final _$_ToDoStoreActionController =
      ActionController(name: '_ToDoStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubTitle(String value) {
    final _$actionInfo = _$_ToDoStoreActionController.startAction(
        name: '_ToDoStore.setSubTitle');
    try {
      return super.setSubTitle(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserTag(String value) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.setUserTag');
    try {
      return super.setUserTag(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFromDate(DateTime value) {
    final _$actionInfo = _$_ToDoStoreActionController.startAction(
        name: '_ToDoStore.setFromDate');
    try {
      return super.setFromDate(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToDue(DateTime value) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.setToDue');
    try {
      return super.setToDue(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodoToList() {
    final _$actionInfo = _$_ToDoStoreActionController.startAction(
        name: '_ToDoStore.addTodoToList');
    try {
      return super.addTodoToList();
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTodo: ${selectedTodo},
todoList: ${todoList}
    ''';
  }
}
