import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/constants/sizes.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../../core/shared/widgets/custom_btn.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/routing/routes.dart';
import 'profile_card.dart';
import '../../view_model/profile_cubit.dart';
import 'profile_shimmer_widget.dart';

class ProfileSuccessWidget extends StatelessWidget {
  final ProfileSuccessState state;

  const ProfileSuccessWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          children: [
            state.profileResponse?.displayName != null
                ? buildProfileCard(
                    context,
                    AppStrings.name,
                    state.profileResponse?.displayName?.trim(),
                  ).fadeInRightBig(null)
                : const ProfileShimmerWidget(),
            verticalSpace(AppSizes.sm),
            state.profileResponse?.phoneNumber != null
                ? buildProfileCard(
                    context,
                    AppStrings.phone,
                    state.profileResponse?.phoneNumber?.trim(),
                  ).fadeInLeftBig(750)
                : const ProfileShimmerWidget(),
            verticalSpace(AppSizes.sm),
            state.profileResponse?.level != null
                ? buildProfileCard(
                    context,
                    AppStrings.level,
                    state.profileResponse?.level?.trim(),
                  ).fadeInRightBig(1000)
                : const ProfileShimmerWidget(),
            verticalSpace(AppSizes.sm),
            state.profileResponse?.experienceYears != null
                ? buildProfileCard(
                    context,
                    AppStrings.experienceYears,
                    state.profileResponse!.experienceYears.toString(),
                  ).fadeInLeftBig(1250)
                : const ProfileShimmerWidget(),
            verticalSpace(AppSizes.sm),
            state.profileResponse?.address != null
                ? buildProfileCard(
                    context,
                    AppStrings.location,
                    state.profileResponse?.address?.trim(),
                  ).fadeInRightBig(1500)
                : const ProfileShimmerWidget(),
            verticalSpace(AppSizes.xl),
            CustomButton(
              onPressed: () => _showLogoutConfirmation(context),
              child: const Text(AppStrings.logout),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    context.showAwesomeDialog(
      title: AppStrings.logoutConfirmation,
      description: AppStrings.areYouSureLogout,
      dialogType: DialogType.warning,
      confirmText: AppStrings.yes,
      cancelText: AppStrings.no,
      onConfirm: () {
        _logoutAndShowSuccessDialog(context);
      },
    );
  }

  void _logoutAndShowSuccessDialog(BuildContext context) {
    context.read<ProfileCubit>().logout();

    context.showAwesomeDialog(
      title: AppStrings.success,
      description: AppStrings.successfullyLoggedOut,
      dialogType: DialogType.success,
      confirmText: AppStrings.ok,
      onConfirm: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeView);
      },
    );
  }
}
