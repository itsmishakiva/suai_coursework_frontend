import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_tasks_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_tasks_params_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_user_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_groups_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_statuses_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_types_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_tasks_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_user_state_holder.dart';
import 'package:suai_coursework_frontend/features/root/presentation/view_model/state_holder/root_router_state_holder.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';
import 'package:suai_coursework_frontend/uikit/app_button.dart';
import 'package:suai_coursework_frontend/uikit/split_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplitView(
      drawer: AppDrawer(),
      child: HomePageContent(),
    );
  }
}

class HomePageContent extends ConsumerWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statuses = ref.watch(homeTasksStatusesStateHolderProvider);
    if (statuses == null) {
      ref.read(homeTasksParamsControllerProvider).getAllParams();
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              statuses?.length ?? 0,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: HomePageColumn(
                    status: statuses![index],
                    icon: SvgPicture.asset(
                      index % 2 == 0
                          ? 'assets/icons/in_work_icon.svg'
                          : 'assets/icons/done_icon.svg',
                      width: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
        groups?.firstWhere((element) => element.id == task.group);
    final type = types?.firstWhere((element) => element.id == task.type);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Material(
        color: context.colors.backgroundSecondary,
        child: InkWell(
          onTap: () {},
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
                                      style:
                                          context.textStyles.subtitle2.copyWith(
                                        color:
                                            group?.color ?? Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
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
                                          backgroundColor:
                                              type?.color ?? Colors.transparent,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.deepPurple,
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

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(homeUserStateHolderProvider);
    if (user == null) {
      ref.read(homeUserControllerProvider).getUser();
    }
    return Material(
      color: context.colors.backgroundPrimary,
      child: SizedBox(
        width: 272,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16.0,
            16.0,
            16.0,
            0.0,
          ),
          child: Column(
            children: [
              if (user != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        user.username[0].toUpperCase(),
                        style: context.textStyles.textField1,
                      ),
                    ),
                    const SizedBox(width: 14.0),
                    Text(
                      user.username,
                      style: context.textStyles.header4,
                    ),
                  ],
                ),
              const SizedBox(height: 26.0),
              AppButton(
                text: 'Новая задача',
                icon: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 14.0,
                  colorFilter: ColorFilter.mode(
                    context.colors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 8.0),
              AppButton(
                text: 'Настройки',
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  width: 14.0,
                  colorFilter: ColorFilter.mode(
                    context.colors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                borderColor: context.colors.backgroundSecondary,
                onTap: () {
                  final box = Hive.box('auth');
                  box.delete('token');
                  ref.read(rootRouterStateHolderProvider)!.replaceNamed('auth');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
