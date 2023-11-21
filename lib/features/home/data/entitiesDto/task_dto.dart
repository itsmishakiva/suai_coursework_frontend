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
      userDto: BasicUserDto.fromJson(json['user']),
    );
  }
}
