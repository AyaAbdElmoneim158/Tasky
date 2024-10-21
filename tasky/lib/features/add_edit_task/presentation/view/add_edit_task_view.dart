import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/leading_btn.dart';
import '../../../../core/utils/constants/strings.dart';
import '../../../../core/utils/constants/styles.dart';
import '../../../../core/utils/routing/router.dart';
import 'widgets/add_edit_task_body.dart';

class AddEditTaskView extends StatelessWidget {
  const AddEditTaskView(
    this.addEditTaskScreenArgs, {
    super.key,
  });
  final AddEditTaskScreenArgs? addEditTaskScreenArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addNewTask,
          style: Styles.font16BlackBold,
        ),
        leading: buildLeadingBtn(context),
      ),
      body: const AddEditTaskBody(),
    );
  }
}
