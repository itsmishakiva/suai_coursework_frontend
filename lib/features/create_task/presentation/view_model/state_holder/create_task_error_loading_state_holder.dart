import 'package:flutter_riverpod/flutter_riverpod.dart';

final createTaskErrorLoadingStateHolderProvider =
StateNotifierProvider<CreateTaskErrorLoadingStateHolder, bool>(
      (ref) => CreateTaskErrorLoadingStateHolder(
    false,
  ),
);

class CreateTaskErrorLoadingStateHolder extends StateNotifier<bool> {
  CreateTaskErrorLoadingStateHolder(super.state);

  void updateState(bool value) {
    state = value;
  }
}
