import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/leading_btn.dart';
import '../../../../core/utils/constants/strings.dart';
import '../../../../core/utils/constants/styles.dart';
import '../../../../core/utils/routing/router.dart';
import 'widgets/add_edit_todo_body.dart';

class AddEditTodoView extends StatelessWidget {
  const AddEditTodoView(
    this.addEditTodoScreenArgs, {
    super.key,
  });
  final AddEditTodoScreenArgs? addEditTodoScreenArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.addNewTask,
          style: Styles.font16BlackBold,
        ),
        leading: const LeadingButton(),
      ),
      body: AddEditTodoBody(addEditTodoScreenArgs: addEditTodoScreenArgs),
    );
  }
}
