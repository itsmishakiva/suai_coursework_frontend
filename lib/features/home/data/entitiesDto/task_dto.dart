import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';

class TaskDto {
  int id;
  String title;
  int statusId;
  String? description;
  int? typeId;
  int? groupId;
  BasicUserDto? userDto;

  TaskDto({
    required this.id,
    required this.title,
    required this.statusId,
    this.description,
    this.typeId,
    this.groupId,
    this.userDto,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      id: json['id'],
      title: json['title'],
      statusId: json['statusId'],
      description: json['description'],
      typeId: json['typeId'],
      groupId: json['groupId'],
      userDto: json['user'] == null ? null : BasicUserDto.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'statusId': statusId,
      'description': description,
      'typeId' : typeId,
      'groupId' : groupId,
      'user' : userDto?.toJson(),
    };
  }

  TaskDto copyWith({
    int? id,
    String? title,
    int? statusId,
    String? description,
    int? typeId,
    int? groupId,
    BasicUserDto? userDto,
  }) {
    return TaskDto(
      id: id ?? this.id,
      title: title ?? this.title,
      statusId: statusId ?? this.statusId,
      description: description ?? this.description,
      typeId: typeId ?? this.typeId,
      groupId: groupId ?? this.groupId,
      userDto: userDto ?? this.userDto,
    );
  }

}
