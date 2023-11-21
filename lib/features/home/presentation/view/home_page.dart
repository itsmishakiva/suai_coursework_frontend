import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view/widgets/app_drawer.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view/widgets/home_page_content.dart';
import 'package:suai_coursework_frontend/uikit/split_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplitView(
      drawer: AppDrawer(),
      child: HomePageContent(),
    );
  }
}
