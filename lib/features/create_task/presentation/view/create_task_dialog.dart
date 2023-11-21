import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/controller/create_task_controller.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_error_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_group.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_status.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/task_type.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_groups_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_statuses_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_types_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_users_state_holder.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';
import 'package:suai_coursework_frontend/uikit/app_button.dart';
import 'package:suai_coursework_frontend/uikit/app_text_button.dart';

class CreateTaskDialog extends ConsumerWidget {
  CreateTaskDialog({
    super.key,
    this.taskInput,
  });

  final Task? taskInput;
  final titleController = TextEditingController();
  final descrController = TextEditingController();

  static void invalidateAll(WidgetRef ref) {
    ref.invalidate(createTaskStateHolderProvider);
    ref.invalidate(createTaskControllerProvider);
    ref.invalidate(createTaskLoadingStateHolderProvider);
    ref.invalidate(
        createTaskErrorLoadingStateHolderProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statuses = ref.watch(homeTasksStatusesStateHolderProvider);
    final types = ref.watch(homeTasksTypesStateHolderProvider);
    final groups = ref.watch(homeTasksGroupsStateHolderProvider);
    final users = ref.watch(homeUsersStateHolderProvider);
    final task = ref.watch(createTaskStateHolderProvider);
    final loading = ref.watch(createTaskLoadingStateHolderProvider);
    final loadingError = ref.watch(createTaskErrorLoadingStateHolderProvider);
    final screenSize = MediaQuery.of(context).size;
    if (taskInput != null && task.id == null) {
      Future(() {
        ref.read(createTaskControllerProvider).updateParams(
              id: taskInput!.id,
              title: taskInput!.title,
              description: taskInput!.description,
              statusId: taskInput!.status,
              typeId: taskInput!.type,
              groupId: taskInput!.group,
              userId: taskInput!.user?.id,
            );
      });
    }
    if (titleController.text != task.title) {
      titleController.text = task.title;
    }
    if (descrController.text != task.description) {
      descrController.text = task.description ?? '';
    }
    return WillPopScope(
      onWillPop: () async {
        invalidateAll(ref);
        return true;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width / 16,
          vertical: screenSize.height / 16,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Material(
            color: context.colors.backgroundPrimary,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      invalidateAll(ref);
                      Navigator.pop(context);
                    },
                    child: Transform.rotate(
                      angle: pi / 4,
                      child: SvgPicture.asset('assets/icons/plus.svg'),
                    ),
                  ),
                  const SizedBox(width: 28.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const SizedBox(height: 28.0),
                        TextFormField(
                          controller: titleController,
                          cursorColor: context.colors.textPrimary,
                          style: context.textStyles.textField1,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Название задачи',
                            hintStyle: context.textStyles.textFieldLabel1,
                          ),
                          onChanged: (value) {
                            titleController.text = value;
                            ref
                                .read(createTaskControllerProvider)
                                .updateParams(title: value);
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: descrController,
                            maxLines: null,
                            cursorColor: context.colors.textPrimary,
                            style: context.textStyles.textField1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Описание задачи',
                              hintStyle: context.textStyles.textFieldLabel1,
                            ),
                            onChanged: (value) {
                              descrController.text = value;
                              ref
                                  .read(createTaskControllerProvider)
                                  .updateParams(description: value);
                            },
                          ),
                        ),
                        const SizedBox(height: 28.0),
                      ],
                    ),
                  ),
                  const SizedBox(width: 28.0),
                  VerticalDivider(
                    color: context.colors.backgroundSecondary,
                    width: 2.0,
                    thickness: 2.0,
                  ),
                  const SizedBox(width: 28.0),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const SizedBox(height: 12.0),
                        AppDropdown<TaskStatus>(
                          hint: 'Статус',
                          converter: (status) => Row(
                            children: [
                              SvgPicture.asset(
                                status.id == 1
                                    ? 'assets/icons/in_work_icon.svg'
                                    : 'assets/icons/done_icon.svg',
                                width: 12,
                              ),
                              const SizedBox(width: 12.0),
                              Text(
                                status.label,
                                style: context.textStyles.textField1,
                              ),
                            ],
                          ),
                          value: statuses?.firstWhereOrNull(
                              (element) => element.id == task.statusId),
                          values: statuses ?? [],
                          onChanged: (value) {
                            ref.read(createTaskControllerProvider).updateParams(
                                  statusId: value!.id,
                                );
                          },
                        ),
                        const SizedBox(height: 12.0),
                        AppDropdown<TaskGroup>(
                          hint: 'Группа',
                          borderColor: groups
                                  ?.firstWhereOrNull(
                                    (element) => element.id == task.groupId,
                                  )
                                  ?.color ??
                              context.colors.textPrimary,
                          converter: (group) => Row(
                            children: [
                              Text(
                                group.label,
                                style: context.textStyles.textField1.copyWith(
                                  color: group.color,
                                ),
                              ),
                            ],
                          ),
                          value: groups?.firstWhereOrNull(
                            (element) => element.id == task.groupId,
                          ),
                          values: groups ?? [],
                          onChanged: (value) {
                            ref.read(createTaskControllerProvider).updateParams(
                                  groupId: value!.id,
                                );
                          },
                        ),
                        const SizedBox(height: 12.0),
                        AppDropdown<TaskType>(
                          hint: 'Тип',
                          converter: (type) => Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: type.color,
                              ),
                              const SizedBox(width: 12.0),
                              Text(
                                type.label,
                                style: context.textStyles.textField1,
                              ),
                            ],
                          ),
                          value: types?.firstWhereOrNull(
                            (element) => element.id == task.typeId,
                          ),
                          values: types ?? [],
                          onChanged: (value) {
                            ref.read(createTaskControllerProvider).updateParams(
                                  typeId: value!.id,
                                );
                          },
                        ),
                        const SizedBox(height: 12.0),
                        AppDropdown<BasicUser>(
                          hint: 'Исполнитель',
                          converter: (user) => Row(
                            children: [
                              CircleAvatar(
                                radius: 9,
                                backgroundColor: user.avatarColor,
                                child: Center(
                                  child: Text(
                                    user.username[0].toUpperCase(),
                                    style: context.textStyles.subtitle3,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Text(
                                user.username,
                                style: context.textStyles.textField1,
                              ),
                            ],
                          ),
                          value: users?.firstWhereOrNull(
                            (element) => element.id == task.userId,
                          ),
                          values: users ?? [],
                          onChanged: (value) {
                            ref.read(createTaskControllerProvider).updateParams(
                                  userId: value!.id,
                                );
                          },
                        ),
                        const Spacer(),
                        AppTextButton(
                          loading: loading,
                          text: 'Сохранить',
                          onTap: () async {
                            if (taskInput == null) {
                              await ref
                                  .read(createTaskControllerProvider)
                                  .createTask();
                              invalidateAll(ref);
                              Navigator.pop(context);
                            } else {
                              await ref
                                  .read(createTaskControllerProvider)
                                  .updateTask();
                              invalidateAll(ref);
                              Navigator.pop(context);
                            }
                          },
                        ),
                        if (taskInput != null) const SizedBox(height: 12.0),
                        if (taskInput != null)
                          AppTextButton(
                            color: context.colors.error,
                            loading: loadingError,
                            text: 'Удалить',
                            onTap: () async {
                              await ref
                                  .read(createTaskControllerProvider)
                                  .deleteTask();
                              ref.invalidate(createTaskStateHolderProvider);
                              ref.invalidate(createTaskControllerProvider);
                              ref.invalidate(
                                  createTaskLoadingStateHolderProvider);
                              ref.invalidate(
                                  createTaskErrorLoadingStateHolderProvider);
                              Navigator.pop(context);
                            },
                          ),
                        const SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.converter,
    this.value,
    required this.values,
    required this.onChanged,
    this.borderColor,
    this.hint,
  });

  final Widget Function(T element) converter;
  final T? value;
  final List<T> values;
  final void Function(T? element) onChanged;
  final Color? borderColor;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
            color: borderColor ?? context.colors.textPrimary, width: 1.0),
      ),
      child: DropdownButton(
        hint: Text(
          hint ?? '',
          style: context.textStyles.textFieldLabel1,
        ),
        dropdownColor: context.colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(12.0),
        underline: const SizedBox(),
        value: value,
        icon: const SizedBox(),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        items: values
            .map(
              (e) => DropdownMenuItem<T>(
                value: e,
                child: converter(e),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
