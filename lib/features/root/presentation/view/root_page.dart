import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/root/presentation/view_model/state_holder/root_router_state_holder.dart';
import 'package:suai_coursework_frontend/routing/app_router.dart';

@RoutePage()
class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoRouter(
      builder: (context, child) {
        final router = ref.watch(rootRouterStateHolderProvider);
        if (router == null) {
          Future(
            () {
              ref
                  .read(rootRouterStateHolderProvider.notifier)
                  .updateState(AutoRouter.of(context));
            },
          );
        }
        return child;
      },
    );
  }
}
