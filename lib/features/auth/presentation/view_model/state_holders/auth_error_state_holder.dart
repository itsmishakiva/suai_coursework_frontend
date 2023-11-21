import 'package:flutter_riverpod/flutter_riverpod.dart';

final authErrorStateHolderProvider =
StateNotifierProvider<AuthErrorStateHolder, String?>(
      (ref) => AuthErrorStateHolder(null),
);

class AuthErrorStateHolder extends StateNotifier<String?> {
  AuthErrorStateHolder(super.state);

  void updateState(String? value) {
    state = value;
  }
}
