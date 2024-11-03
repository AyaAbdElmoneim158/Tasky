import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/constants/strings.dart';
import 'package:tasky/core/utils/constants/styles.dart';

import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../view_model/todo_cubit.dart';
import 'card_todo_type.dart';
import 'task_info_card.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
        listener: (BuildContext context, TodoState state) {},
        builder: (BuildContext context, TodoState state) {
          final homeCubit = BlocProvider.of<TodoCubit>(context);

          //! Use Switch
          if (state is TodoLoadingState) {
            return buildLoadingWidget(); //! Add Shimmer effect
          } else if (state is TodoErrorState) {
            return buildErrorWidget(); //! Add Shimmer effect
          } else if (state is TodoSuccessState) {
            return buildSuccessWidget(homeCubit);
          } else {
            return buildErrorWidget(); //! Add Shimmer effect
          }
        });
  }

  Widget buildSuccessWidget(TodoCubit homeCubit) {
    return SingleChildScrollView(
      child: RefreshIndicator(
        onRefresh: () async {
          homeCubit.getTodosList();
        },
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.myTasks, style: Styles.font16GrayBold),
              verticalSpace(AppSizes.spaceBtwItems),
              _buildTodosTypesList(homeCubit),
              verticalSpace(AppSizes.spaceBtwItems),
              ListView.separated(
                // shrinkWrap to ensure it takes only necessary space
                shrinkWrap: true,
                // Disabling scrolling for ListView itself
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildTodoInfoCard(homeCubit.items![index], context);
                },
                separatorBuilder: (context, index) => verticalSpace(10),
                itemCount: homeCubit.items!.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoadingWidget() {
    return const Center(
      child: SizedBox(
        height: 24,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildErrorWidget() {
    return const Center(child: Text("Error happened ...!"));
  }

  Widget _buildTodosTypesList(TodoCubit homeCubit) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.read<TodoCubit>().changeTodoStatusCategory(homeCubit.categoriesList[index]);
          },
          child: CardTodoType(taskType: homeCubit.categoriesList[index], isSelected: index == 0 ? true : false),
        ),
        separatorBuilder: (context, index) => horizontalSpace(AppSizes.spaceBtwItems / 2),
        itemCount: homeCubit.categoriesList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

/*GestureDetector(
                onTap: () {
                  //ToDo: do... TodoResponse.task.object
                  // TodoDetails
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TodoDetails(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(homeCubit.items![index].title ?? "empty...null"),
                  trailing: GestureDetector(
                    onTap: () {
                      homeCubit.deleteTodoById(homeCubit.items![index].id!);
                      debugPrint("delete Todo");
                    },
                    child: const Icon(Icons.edit),
                  ),
                ),
              ),*/
