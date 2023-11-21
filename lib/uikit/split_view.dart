import 'package:flutter/material.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';

class SplitView extends StatelessWidget {
  const SplitView({
    super.key,
    required this.drawer,
    required this.child,
  });

  final Widget drawer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    bool breakpoint = screenSize.width >= 900;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.colors.backgroundPrimary,
      appBar: breakpoint ? null : PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu),
          ),
        ),
      ),
      body: Row(
        children: [
          if (breakpoint) drawer,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0),
            child: VerticalDivider(
              width: 2.0,
              thickness: 2.0,
              color: context.colors.backgroundSecondary,
            ),
          ),
          Expanded(child: child),
        ],
      ),
      drawer: breakpoint ? null : drawer,

    );
  }
}
