import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/use_cases/home_user_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_user_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_user_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_users_state_holder.dart';

final homeUserControllerProvider = Provider<HomeUserController>(
  (ref) => HomeUserController(
    useCase: HomeUserUseCase(),
    userStateHolder: ref.watch(homeUserStateHolderProvider.notifier),
    usersStateHolder: ref.watch(homeUsersStateHolderProvider.notifier),
  ),
);

class HomeUserController {
  final IHomeUserUseCase useCase;
  final HomeUserStateHolder userStateHolder;
  final HomeUsersStateHolder usersStateHolder;

  HomeUserController({
    required this.useCase,
    required this.userStateHolder,
    required this.usersStateHolder,
  });

  Future<void> getData() async {
    await _getUser();
    await _getUsers();
  }

  Future<void> _getUser() async {
    final result = await useCase.getMyselfUser();
    if (result == null) {
      //TODO Error logic
      return;
    }
    userStateHolder.updateState(result);
  }

  Future<void> _getUsers() async {
    final result = await useCase.getAllUsers();
    if (result == null) {
      //TODO Error logic
      return;
    }
    usersStateHolder.updateState(result);
  }
}
