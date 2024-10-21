import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/constants/sizes.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../view_model/profile_cubit.dart';
import 'profile_card.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listenWhen: (previous, current) =>
            current is ProfileLoadingState ||
            current is ProfileSuccessState ||
            current is ProfileErrorState,
        listener: (BuildContext context, ProfileState state) {
          if (state is ProfileErrorState) {
            //!showDialog
            context.showAwesomeSnackBar(
              message: state.error,
              type: ContentType.failure,
            );
          }
        },
        builder: (BuildContext context, ProfileState state) {
          // final profileCubit = BlocProvider.of<ProfileCubit>(context);
          //! Use Switch
          if (state is ProfileLoadingState) {
            return buildLoadingWidget(); //! Add Shimmer effect
          } else if (state is ProfileErrorState) {
            return buildErrorWidget(); //! Add Shimmer effect
          } else if (state is ProfileSuccessState) {
            return buildSuccessWidget(context, state);
          } else {
            return const Text(
                "Error happened ... check connection internet"); //! Add Shimmer effect
          }
        });
  }

  SizedBox buildLoadingWidget() {
    return const SizedBox(
      height: 24,
      child: CircularProgressIndicator(),
    );
  }

  Text buildErrorWidget() {
    return const Text("Error happened ... check connection internet");
  }

  SingleChildScrollView buildSuccessWidget(
      BuildContext context, ProfileSuccessState state) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(
          children: [
            buildProfileCard(
              context,
              AppStrings.name,
              state.profileResponse.displayName,
            ),
            verticalSpace(AppSizes.sm),
            buildProfileCard(
              context,
              AppStrings.phone,
              state.profileResponse.phoneNumber,
            ),
            verticalSpace(AppSizes.sm),
            buildProfileCard(
              context,
              AppStrings.level,
              state.profileResponse.level,
            ),
            verticalSpace(AppSizes.sm),
            buildProfileCard(
              context,
              AppStrings.experienceYears,
              state.profileResponse.experienceYears,
            ),
            verticalSpace(AppSizes.sm),
            buildProfileCard(
              context,
              AppStrings.location,
              state.profileResponse.address,
            ),
            verticalSpace(AppSizes.sm),
          ],
        ),
      ),
    );
  }
}
