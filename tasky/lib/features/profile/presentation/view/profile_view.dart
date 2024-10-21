import 'package:flutter/material.dart';
import 'package:tasky/features/profile/presentation/view/widgets/profile_body.dart';
import '../../../../core/shared/widgets/leading_btn.dart';
import '../../../../core/utils/constants/strings.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.profile),
        leading: const LeadingButton(),
      ),
      body: const ProfileBody(),
    );
  }
}
