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

  late final _$doneTodoListAtom =
      Atom(name: '_ToDoStore.doneTodoList', context: context);

  @override
  List<ToDo> get doneTodoList {
    _$doneTodoListAtom.reportRead();
    return super.doneTodoList;
  }

  @override
  set doneTodoList(List<ToDo> value) {
    _$doneTodoListAtom.reportWrite(value, super.doneTodoList, () {
      super.doneTodoList = value;
    });
  }

  late final _$archiveTodoListAtom =
      Atom(name: '_ToDoStore.archiveTodoList', context: context);

  @override
  List<ToDo> get archiveTodoList {
    _$archiveTodoListAtom.reportRead();
    return super.archiveTodoList;
  }

  @override
  set archiveTodoList(List<ToDo> value) {
    _$archiveTodoListAtom.reportWrite(value, super.archiveTodoList, () {
      super.archiveTodoList = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_ToDoStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$deleteActiveTodoAsyncAction =
      AsyncAction('_ToDoStore.deleteActiveTodo', context: context);

  @override
  Future<dynamic> deleteActiveTodo(ToDo value) {
    return _$deleteActiveTodoAsyncAction
        .run(() => super.deleteActiveTodo(value));
  }

  late final _$deleteDoneTodoAsyncAction =
      AsyncAction('_ToDoStore.deleteDoneTodo', context: context);

  @override
  Future<dynamic> deleteDoneTodo(ToDo value) {
    return _$deleteDoneTodoAsyncAction.run(() => super.deleteDoneTodo(value));
  }

  late final _$deleteArchiveTodoAsyncAction =
      AsyncAction('_ToDoStore.deleteArchiveTodo', context: context);

  @override
  Future<dynamic> deleteArchiveTodo(ToDo value) {
    return _$deleteArchiveTodoAsyncAction
        .run(() => super.deleteArchiveTodo(value));
  }

  late final _$archiveTodoAsyncAction =
      AsyncAction('_ToDoStore.archiveTodo', context: context);

  @override
  Future<dynamic> archiveTodo(ToDo value) {
    return _$archiveTodoAsyncAction.run(() => super.archiveTodo(value));
  }

  late final _$doneTodoAsyncAction =
      AsyncAction('_ToDoStore.doneTodo', context: context);

  @override
  Future<dynamic> doneTodo(ToDo value) {
    return _$doneTodoAsyncAction.run(() => super.doneTodo(value));
  }

  late final _$returnToTodoAsyncAction =
      AsyncAction('_ToDoStore.returnToTodo', context: context);

  @override
  Future<dynamic> returnToTodo(ToDo value) {
    return _$returnToTodoAsyncAction.run(() => super.returnToTodo(value));
  }

  late final _$returnTodoFromArchiveAsyncAction =
      AsyncAction('_ToDoStore.returnTodoFromArchive', context: context);

  @override
  Future<dynamic> returnTodoFromArchive(ToDo value) {
    return _$returnTodoFromArchiveAsyncAction
        .run(() => super.returnTodoFromArchive(value));
  }

  late final _$addTodoToListAsyncAction =
      AsyncAction('_ToDoStore.addTodoToList', context: context);

  @override
  Future<void> addTodoToList() {
    return _$addTodoToListAsyncAction.run(() => super.addTodoToList());
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
  void setTime(String value) {
    final _$actionInfo =
        _$_ToDoStoreActionController.startAction(name: '_ToDoStore.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_ToDoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTodo: ${selectedTodo},
todoList: ${todoList},
doneTodoList: ${doneTodoList},
archiveTodoList: ${archiveTodoList}
    ''';
  }
}
