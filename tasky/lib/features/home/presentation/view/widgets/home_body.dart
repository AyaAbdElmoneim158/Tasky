import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/constants/strings.dart';
import 'package:tasky/core/utils/constants/styles.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../view_model/home_cubit.dart';
import 'card_task_type.dart';
import 'task_info_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {},
        builder: (BuildContext context, HomeState state) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);

          //! Use Switch
          if (state is HomeLoadingState) {
            return buildLoadingWidget(); //! Add Shimmer effect
          } else if (state is HomeErrorState) {
            return buildErrorWidget(); //! Add Shimmer effect
          } else if (state is HomeSuccessState) {
            return buildSuccessWidget(homeCubit);
          } else {
            return const Text(
                "Error happened ... check connection internet"); //! Add Shimmer effect
          }
        });
  }

  Padding buildSuccessWidget(HomeCubit homeCubit) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.myTasks, style: Styles.font16GrayBold),
          verticalSpace(AppSizes.spaceBtwItems),
          // List.hor ----------------------------------------------------------------
          _buildTasksTypesList(homeCubit.categoriesList),
          verticalSpace(AppSizes.spaceBtwItems),

          // List.Vir ----------------------------------------------------------------
          buildTaskInfoCard()
        ],
      ),
    );
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

  Widget _buildTasksTypesList(List<String> tasksTypes) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        itemBuilder: (context, index) =>
            CardTaskType(taskType: tasksTypes[index]),
        separatorBuilder: (context, index) =>
            horizontalSpace(AppSizes.spaceBtwItems / 2),
        itemCount: tasksTypes.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
