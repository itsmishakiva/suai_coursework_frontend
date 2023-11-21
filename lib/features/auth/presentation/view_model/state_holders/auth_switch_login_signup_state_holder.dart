import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSwitchLoginSignupStateHolder =
    StateNotifierProvider<AuthSwitchLoginSignupStateHolder, bool>(
  (ref) => AuthSwitchLoginSignupStateHolder(true),
);

class AuthSwitchLoginSignupStateHolder extends StateNotifier<bool> {
  AuthSwitchLoginSignupStateHolder(super.state);

  void switchLoginSignup() {
    state = !state;
  }
}
