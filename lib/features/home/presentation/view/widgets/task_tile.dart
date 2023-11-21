import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view/create_task_dialog.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/controller/create_task_controller.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_groups_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_types_state_holder.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';

class TaskTile extends ConsumerWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(homeTasksTypesStateHolderProvider);
    final groups = ref.watch(homeTasksGroupsStateHolderProvider);
    final group =
        groups?.firstWhereOrNull((element) => element.id == task.group);
    final type = types?.firstWhereOrNull((element) => element.id == task.type);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Material(
        color: context.colors.backgroundSecondary,
        child: InkWell(
          onTap: () {
            CreateTaskDialog.invalidateAll(ref);
            showDialog(
              context: context,
              builder: (context) => CreateTaskDialog(
                taskInput: task,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: context.textStyles.header3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (group != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Material(
                              color: Colors.transparent,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: group?.color ?? Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                    child: Center(
                                      child: Text(
                                        group?.label ?? '',
                                        style: context.textStyles.subtitle2
                                            .copyWith(
                                          color: group?.color ??
                                              Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (type != null) const SizedBox(width: 8.0),
                        if (type != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Material(
                              color: Colors.transparent,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: context.colors.textPrimary,
                                  width: 1.0,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Center(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 2.5,
                                            backgroundColor: type?.color ??
                                                Colors.transparent,
                                          ),
                                          const SizedBox(width: 4.0),
                                          Text(
                                            type?.label ?? '',
                                            style: context.textStyles.subtitle2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  task.description ?? '',
                  style: context.textStyles.bodyText1,
                ),
                const SizedBox(height: 12.0),
                if (task.user != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: task.user?.avatarColor,
                        child: Text(
                          task.user?.username[0].toUpperCase() ?? '',
                          style: context.textStyles.subtitle3,
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        task.user?.username ?? '',
                        style: context.textStyles.subtitle2,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
