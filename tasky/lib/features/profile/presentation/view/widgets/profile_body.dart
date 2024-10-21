import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../view_model/profile_cubit.dart';
import 'profile_shimmer_widget.dart';
import 'profile_success_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (BuildContext context, ProfileState state) {
        if (state is ProfileErrorState) {
          context.showAwesomeSnackBar(
            message: state.error,
            type: ContentType.failure,
          );
        }
      },
      builder: (BuildContext context, ProfileState state) =>
          ((state is ProfileLoadingState) || (state is ProfileErrorState))
              ? const ProfileShimmerWidget()
              : (state is ProfileSuccessState)
                  ? ProfileSuccessWidget(state: state)
                  : const Text("Error happened!"),
    );
  }
}
