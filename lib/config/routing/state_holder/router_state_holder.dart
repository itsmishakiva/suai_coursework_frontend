import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/routing/app_router.dart';

final routerStateHolderProvider =
StateNotifierProvider<RouterStateHolder, StackRouter?>(
      (ref) => RouterStateHolder(null),
);

class RouterStateHolder extends StateNotifier<StackRouter?> {
  RouterStateHolder(super.state);

  void updateState(StackRouter value) {
    state = value;
  }
}
