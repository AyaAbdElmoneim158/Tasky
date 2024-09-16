import 'package:flutter/material.dart';
import '../../utils/constants/styles.dart';

class AuthFooterRichText extends StatelessWidget {
  const AuthFooterRichText({
    super.key,
    this.span1,
    this.span2,
    this.onPressed,
  });

  final String? span1;
  final String? span2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(text: span1 ?? '', style: Styles.font14LightGrayRegular),
            WidgetSpan(
              baseline: TextBaseline.ideographic,
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                onPressed: onPressed!,
                child: Text(
                  span2 ?? '',
                  style: Styles.font14PurpleBold
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
