import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:todo/stores/todo_store.dart';

GetIt serviceLocator = GetIt.instance;
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 30,
    errorMethodCount: 5,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);
///создание синглтона для работы с классом
void setupSingleton(){
  serviceLocator.registerSingleton<ToDoStore>(ToDoStore());
}