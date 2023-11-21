import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view/widgets/task_tile.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_tasks_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_tasks_state_holder.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';

class HomePageColumn extends ConsumerWidget {
  const HomePageColumn({
    super.key,
    required this.status,
    required this.icon,
  });

  final TaskStatus status;
  final Widget icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(homeTasksStateHolderProvider);
    if (tasks == null) {
      ref.read(homeTasksControllerProvider).getTasks();
    }
    final screenSize = MediaQuery.of(context).size;
    bool breakpoint = screenSize.width >= 900;
    return Column(
      children: [
        if (breakpoint) const SizedBox(height: 16.0),
        Container(
          height: 35,
          decoration: BoxDecoration(
            color: context.colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 12.0),
              Text(
                status.label,
                style: context.textStyles.header2,
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Column(
          children: List.generate(
            tasks?.where((element) => element.status == status.id).length ?? 0,
                (index) => Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TaskTile(
                task: tasks!
                    .where((element) => element.status == status.id)
                    .toList()[index],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}