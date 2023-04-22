// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDo _$ToDoFromJson(Map<String, dynamic> json) => ToDo(
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      userTag: json['userTag'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      description: json['description'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'userTag': instance.userTag,
      'description': instance.description,
      'time': instance.time,
      'dueDate': instance.dueDate?.toIso8601String(),
    };
