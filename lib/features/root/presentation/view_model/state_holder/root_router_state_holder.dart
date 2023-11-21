import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/routing/app_router.dart';

final rootRouterStateHolderProvider =
StateNotifierProvider<RootRouterStateHolder, StackRouter?>(
      (ref) => RootRouterStateHolder(null),
);

class RootRouterStateHolder extends StateNotifier<StackRouter?> {
  RootRouterStateHolder(super.state);

  void updateState(StackRouter value) {
    state = value;
  }
}
