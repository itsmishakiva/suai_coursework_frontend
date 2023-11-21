import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLoadingStateHolderProvider =
    StateNotifierProvider<AuthLoadingStateHolder, bool>(
  (ref) => AuthLoadingStateHolder(false),
);

class AuthLoadingStateHolder extends StateNotifier<bool> {
  AuthLoadingStateHolder(super.state);

  void updateState(bool value) {
    state = value;
  }
}
