import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/leading_btn.dart';
import '../../../../core/utils/constants/strings.dart';
import 'widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.profile),
        leading: buildLeadingBtn(context),
      ),
      body: const ProfileBody(),
    );
  }
}
