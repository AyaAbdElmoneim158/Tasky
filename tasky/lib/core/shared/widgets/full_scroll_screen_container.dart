import 'package:flutter/material.dart';

class FullScrollScreenContainer extends StatelessWidget {
  const FullScrollScreenContainer({
    super.key,
    this.child,
    this.hasHight = false,
  });
  final Widget? child;
  final bool hasHight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: hasHight ? MediaQuery.of(context).size.height : null,
            width: MediaQuery.of(context).size.width,
            child: child,
          ),
        ),
      ),
    );
  }
}
