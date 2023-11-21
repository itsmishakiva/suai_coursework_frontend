import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/use_cases/home_user_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/i_use_cases/i_home_user_use_case.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_user_state_holder.dart';

final homeUserControllerProvider = Provider<HomeUserController>(
  (ref) => HomeUserController(
    useCase: HomeUserUseCase(),
    userStateHolder: ref.watch(homeUserStateHolderProvider.notifier),
  ),
);

class HomeUserController {
  final IHomeUserUseCase useCase;
  final HomeUserStateHolder userStateHolder;

  HomeUserController({
    required this.useCase,
    required this.userStateHolder,
  });

  Future<void> getUser() async {
    final result = await useCase.getMyselfUser();
    if (result == null) {
      //TODO Error logic
      return;
    }
    userStateHolder.updateState(result);
  }
}
