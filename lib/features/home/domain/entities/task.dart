import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';

class Task {
  int id;
  String title;
  int status;
  String? description;
  int? type;
  int? group;
  BasicUser? user;

  Task({
    required this.id,
    required this.title,
    required this.status,
    this.description,
    this.type,
    this.group,
    this.user,
  });
}
