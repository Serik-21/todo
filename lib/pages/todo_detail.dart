import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/assets.dart';
import 'package:todo/stores/todo_store.dart';
import '../service_locator.dart';

class ToDoDetails extends StatefulWidget {
  const ToDoDetails({Key? key}) : super(key: key);

  @override
  State<ToDoDetails> createState() => _ToDoDetailsState();
}

class _ToDoDetailsState extends State<ToDoDetails> {
  final todoStore = serviceLocator<ToDoStore>();
  DateTime? fromDate = DateTime.now();
  bool showDueField = false;
  DateTime? dueDate;
  final fromDateController = TextEditingController();
  final dueDateController = TextEditingController();
  String requiredField = "Обезательное поле";
  final _formKey = GlobalKey<FormState>();
  void setRange(DateTimeRange? value) {
    if (value?.start != null) {
      fromDate = value!.start;
      String formattedDate = DateFormat('yyyy.MM.dd').format(fromDate!);
      fromDateController.text = formattedDate;
      todoStore.setFromDate(fromDate!);
      if (value.end == null) {
        setState(() {
          showDueField = false;
        });
      }
    }
    if (value?.end != null) {
      setState(() {
        showDueField = true;
      });
      dueDate = value!.end;
      String formattedDate = DateFormat('yyyy.MM.dd').format(dueDate!);
      dueDateController.text = formattedDate;
      todoStore.setToDue(dueDate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Observer(builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return requiredField;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Заголовок'),
                    onChanged: (value) => todoStore.setTitle(value),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return requiredField;
                      }
                      return null;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Подзаголовок'),
                    onChanged: (value) => todoStore.setSubTitle(value),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return requiredField;
                      }
                      return null;
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: showDueField == false
                          ? 'Выбрать дату'
                          : "Дата начало",
                      suffixIcon: IconButton(
                          onPressed: () {
                            showDateRangePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2045),
                            ).then((value) {
                              setRange(value);
                            });
                          },
                          icon: const Icon(Icons.calendar_month_rounded)),
                    ),
                    controller: fromDateController,
                  ),
                  if (showDueField == true)
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                  if (showDueField == true)
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return requiredField;
                        }
                        return null;
                      },
                      readOnly: true,
                      controller: dueDateController,
                      decoration: const InputDecoration(
                        labelText: 'Дата завершения',
                      ),
                    ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return requiredField;
                      }
                      return null;
                    },
                    readOnly: true,
                    controller: dueDateController,
                    decoration: InputDecoration(
                        labelText: 'Время',
                        suffixIcon: IconButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),

                              );
                            },
                            icon: const Icon(Icons.watch_later_outlined))),
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),

                  OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          todoStore.addTodoToList();
                          context.pop();
                        }
                      },
                      child: const Text("Добавить задачу"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
