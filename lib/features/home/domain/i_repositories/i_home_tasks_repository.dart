import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';

abstract interface class IHomeTasksRepository {
  Future<List<Task>> getTasks();
}
