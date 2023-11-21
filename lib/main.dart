import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:suai_coursework_frontend/config/routing/state_holder/router_state_holder.dart';
import 'package:suai_coursework_frontend/routing/app_router.dart';
import 'package:suai_coursework_frontend/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  Hive.init(path);
  Hive.openBox('auth');
  runApp(
    ProviderScope(
      child: Application(),
    ),
  );
}

class Application extends ConsumerWidget {
  Application({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerStateHolderProvider);
    if (router == null) {
      Future(() {
        ref.read(routerStateHolderProvider.notifier).updateState(_router);
      });
    }
    return MaterialApp.router(
      theme: AppThemes().darkThemeData(),
      routerConfig: _router.config(),
    );
  }
}
