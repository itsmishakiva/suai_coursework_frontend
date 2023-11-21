import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';

final homeUserStateHolderProvider =
    StateNotifierProvider<HomeUserStateHolder, BasicUser?>(
  (ref) => HomeUserStateHolder(null),
);

class HomeUserStateHolder extends StateNotifier<BasicUser?> {
  HomeUserStateHolder(super.state);

  void updateState(BasicUser user) {
    state = user;
  }
}
