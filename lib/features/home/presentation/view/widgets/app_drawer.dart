import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:suai_coursework_frontend/config/routing/state_holder/router_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view/create_task_dialog.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/controller/create_task_controller.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/create_task/presentation/view_model/state_holder/create_task_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_user_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_user_state_holder.dart';
import 'package:suai_coursework_frontend/features/root/presentation/view_model/state_holder/root_router_state_holder.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';
import 'package:suai_coursework_frontend/uikit/app_button.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(homeUserStateHolderProvider);
    final screenSize = MediaQuery.of(context).size;
    if (user == null) {
      ref.read(homeUserControllerProvider).getData();
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
                      backgroundColor: user.avatarColor,
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
                onTap: () {
                  CreateTaskDialog.invalidateAll(ref);
                  showDialog(
                    context: context,
                    builder: (context) => CreateTaskDialog(),
                  );
                },
              ),
              const SizedBox(height: 8.0),
              AppButton(
                text: 'Выход',
                style: context.textStyles.onButton.copyWith(
                  color: context.colors.error,
                ),
                icon: const SizedBox(),
                borderColor: context.colors.error,
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
