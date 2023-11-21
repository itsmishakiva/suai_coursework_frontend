import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view/widgets/home_page_column.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_tasks_params_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_task_statuses_state_holder.dart';

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