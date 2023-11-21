import 'package:suai_coursework_frontend/features/home/data/entitiesDto/basic_user_dto.dart';

class UiTaskDto {
  int? id;
  String title;
  int statusId;
  String? description;
  int? typeId;
  int? groupId;
  int? userId;

  UiTaskDto({
    this.id,
    required this.title,
    required this.statusId,
    this.description,
    this.typeId,
    this.groupId,
    this.userId,
  });

  factory UiTaskDto.fromJson(Map<String, dynamic> json) {
    return UiTaskDto(
      id: json['id'],
      title: json['title'],
      statusId: json['statusId'],
      description: json['description'],
      typeId: json['typeId'],
      groupId: json['groupId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'statusId': statusId,
      'description': description,
      'typeId' : typeId,
      'groupId' : groupId,
      'userId' : userId,
    };
  }

  UiTaskDto copyWith({
    int? id,
    String? title,
    int? statusId,
    String? description,
    int? typeId,
    int? groupId,
    int? userId,
  }) {
    return UiTaskDto(
      id: id ?? this.id,
      title: title ?? this.title,
      statusId: statusId ?? this.statusId,
      description: description ?? this.description,
      typeId: typeId ?? this.typeId,
      groupId: groupId ?? this.groupId,
      userId: userId ?? this.userId,
    );
  }

}
