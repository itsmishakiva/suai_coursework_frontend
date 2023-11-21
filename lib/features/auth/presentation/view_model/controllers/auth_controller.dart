import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:suai_coursework_frontend/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/state_holders/auth_error_state_holder.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/state_holders/auth_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/state_holders/auth_switch_login_signup_state_holder.dart';
import 'package:suai_coursework_frontend/features/root/presentation/view_model/state_holder/root_router_state_holder.dart';

final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(
    authErrorStateHolder: ref.watch(authErrorStateHolderProvider.notifier),
    authLoadingStateHolder: ref.watch(authLoadingStateHolderProvider.notifier),
    authSwitchLoginSignupStateHolder:
        ref.watch(authSwitchLoginSignupStateHolder.notifier),
    router: ref.watch(rootRouterStateHolderProvider)!,
    useCase: AuthUseCase(),
  ),
);

class AuthController {
  final AuthErrorStateHolder authErrorStateHolder;
  final AuthLoadingStateHolder authLoadingStateHolder;
  final AuthSwitchLoginSignupStateHolder authSwitchLoginSignupStateHolder;
  final StackRouter router;
  final AuthUseCase useCase;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();

  AuthController({
    required this.authErrorStateHolder,
    required this.authLoadingStateHolder,
    required this.authSwitchLoginSignupStateHolder,
    required this.router,
    required this.useCase,
  });

  Future<void> checkAuthed() async {
    try {
      final box = Hive.box('auth');
      String? value = box.get('token');
      if (value == null) return;
      router.replaceNamed('home');
    } catch (e) {
      return;
    }
  }

  Future<void> auth() async {
    authLoadingStateHolder.updateState(true);
    final result = await useCase.auth(
      usernameController.text,
      passwordController.text,
    );
    authErrorStateHolder.updateState(result);
    if (result == null) {
      router.replaceNamed('home');
    }
    usernameController.clear();
    passwordController.clear();
    passwordRepeatController.clear();
    authLoadingStateHolder.updateState(false);
  }

  Future<void> signup() async {
    authLoadingStateHolder.updateState(true);
    final result = await useCase.signup(
      usernameController.text,
      passwordController.text,
      passwordRepeatController.text,
    );
    authErrorStateHolder.updateState(result);
    if (result == null) {
      router.replaceNamed('home');
    }
    usernameController.clear();
    passwordController.clear();
    passwordRepeatController.clear();
    authLoadingStateHolder.updateState(false);
  }

  void switchLoginSignup() {
    authSwitchLoginSignupStateHolder.switchLoginSignup();
  }
}
