import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suai_coursework_frontend/features/home/domain/entities/basic_user.dart';

final homeUsersStateHolderProvider =
StateNotifierProvider<HomeUsersStateHolder, List<BasicUser>?>(
      (ref) => HomeUsersStateHolder(null),
);

class HomeUsersStateHolder extends StateNotifier<List<BasicUser>?> {
  HomeUsersStateHolder(super.state);

  void updateState(List<BasicUser>? users) {
    state = users;
  }
}
