import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/assets.dart';
import 'package:todo/stores/todo_store.dart';
import '../models/event_model.dart';
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
  final timeController = TextEditingController();
  String requiredField = "Обезательное поле";
  final _formKey = GlobalKey<FormState>();
  void setRange(DateTime? value) {
    if (value != null) {
      fromDate = value;
      String formattedDate = DateFormat(kDefaultDataFormat)
          .format(fromDate!.subtract(const Duration(hours: 17, minutes: 3)));
      fromDateController.text = formattedDate;
      todoStore.setFromDate(fromDate!);
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
                    decoration: const InputDecoration(labelText: 'Тақырыбы'),
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
                        const InputDecoration(labelText: 'Қосымша тақырып'),
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
                      labelText: 'Күнді таңдаңыз',
                      suffixIcon: IconButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialEntryMode:
                                  DatePickerEntryMode.calendarOnly,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2045),
                              cancelText: "Болдырмау",
                              initialDate: DateTime.now(),
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
                        labelText: 'Аяқтау күні',
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
                    controller: timeController,
                    decoration: InputDecoration(
                        labelText: 'Уақыт',
                        suffixIcon: IconButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                confirmText: "Таңдау",
                                initialEntryMode: TimePickerEntryMode.dialOnly,
                                cancelText: "Болдырмау",
                                hourLabelText: "Уақытты таңдаңыз",
                              ).then((value) {
                                timeController.text = value!.format(context);
                                todoStore.setTime(value.format(context));
                              });
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
                      child: const Text("Тапсырма қосу"))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
