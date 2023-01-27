// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo _$ToDoFromJson(Map<String, dynamic> json) => ToDo(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      userTag: json['userTag'] as String?,
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'userTag': instance.userTag,
      'fromDate': instance.fromDate?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
    };
