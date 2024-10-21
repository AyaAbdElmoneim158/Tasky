import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultPadding),
      child: SizedBox(
        width: AppHelperFunctions.screenWidth(context),
        child: ElevatedButton(
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
