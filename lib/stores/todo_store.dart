
import 'package:mobx/mobx.dart';
import 'package:todo/models/event_model.dart';
part 'todo_store.g.dart';

class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store {
  _ToDoStore();

  @observable
  ToDo? selectedTodo = ToDo();

  @observable
  List<ToDo> todoList = [];

  @action
  void setTitle(String value) {
    final _temp = selectedTodo!;
    _temp.title = value;
    selectedTodo = _temp;
  }

  @action
  void setSubTitle(String value) {
    final _temp = selectedTodo!;
    _temp.subTitle = value;
    selectedTodo = _temp;
  }

  @action
  void setUserTag(String value) {
    final _temp = selectedTodo!;
    _temp.userTag = value;
    selectedTodo = _temp;
  }

  @action
  void setFromDate(DateTime value) {
    final _temp = selectedTodo!;
    _temp.fromDate = value;
    selectedTodo = _temp;
  }

  @action
  void setToDue(DateTime value) {
    final _temp = selectedTodo!;
    _temp.dueDate = value;

    selectedTodo = _temp;
  }

  @action
  void addTodoToList() {
    ToDo toDo = ToDo(
      title: selectedTodo!.title,
      subTitle: selectedTodo!.subTitle,
      userTag: selectedTodo!.userTag,
      fromDate: selectedTodo!.fromDate,
      dueDate: selectedTodo!.dueDate
    );
    todoList.add(toDo);
  }
}
