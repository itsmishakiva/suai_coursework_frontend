import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';

abstract interface class IHomeTasksParamsUseCase {
  Future<List<TaskGroup>?> getGroups();

  Future<List<TaskType>?> getTypes();

  Future<List<TaskStatus>?> getStatuses();
}
