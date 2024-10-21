import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/app_title.dart';
import 'widgets/home_actions_btns.dart';
import 'widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildAppTitle(context),
        actions: buildHomeActionsBtns(context),
      ),
      // floatingActionButton: buildHomeFloatingActionBtns(),
      body: const HomeBody(),
    );
  }
}
