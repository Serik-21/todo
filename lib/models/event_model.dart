import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class ToDo{
  String? title;
  String? subTitle;
  String? userTag;
  DateTime? fromDate;
  DateTime? dueDate;

  ToDo({this.title, this.subTitle, this.userTag, this.fromDate, this.dueDate});

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoToJson(this);
}