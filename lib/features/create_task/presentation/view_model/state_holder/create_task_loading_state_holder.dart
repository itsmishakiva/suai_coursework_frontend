import 'package:flutter_riverpod/flutter_riverpod.dart';

final createTaskLoadingStateHolderProvider =
    StateNotifierProvider<CreateTaskLoadingStateHolder, bool>(
  (ref) => CreateTaskLoadingStateHolder(
    false,
  ),
);

class CreateTaskLoadingStateHolder extends StateNotifier<bool> {
  CreateTaskLoadingStateHolder(super.state);

  void updateState(bool value) {
    state = value;
  }
}
