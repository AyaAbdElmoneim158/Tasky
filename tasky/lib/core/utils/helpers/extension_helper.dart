import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// Extension on Widget to add all animations from animate_do
extension AnimateExtension on Widget {
  // FadeIn Animations
  Widget fadeIn(
    int? milliseconds, {
    int delay = 0,
    bool manualTrigger = false,
  }) =>
      FadeIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        manualTrigger: manualTrigger,
        child: this,
      );

  Widget fadeInDown(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInDownBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInDownBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInUp(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInUpBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInUpBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInLeft(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInLeftBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInLeftBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInRight(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInRightBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeInRightBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // FadeOut Animations
  Widget fadeOut(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOut(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutDown(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutDownBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutDownBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutUp(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutUpBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutUpBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutLeft(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutLeftBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutLeftBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutRight(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutRightBig(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FadeOutRightBig(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Bounce Animations
  Widget bounceInDown(
    int? milliseconds, {
    int delay = 0,
  }) =>
      BounceInDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInUp(
    int? milliseconds, {
    int delay = 0,
  }) =>
      BounceInUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInLeft(
    int? milliseconds, {
    int delay = 0,
  }) =>
      BounceInLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInRight(
    int? milliseconds, {
    int delay = 0,
  }) =>
      BounceInRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Elastic Animations
  Widget elasticIn(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ElasticIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInDown(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ElasticInDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInUp(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ElasticInUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInLeft(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ElasticInLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInRight(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ElasticInRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // SlideIn Animations
  Widget slideInDown(
    int? milliseconds, {
    int delay = 0,
  }) =>
      SlideInDown(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInUp(
    int? milliseconds, {
    int delay = 0,
  }) =>
      SlideInUp(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInLeft(
    int? milliseconds, {
    int delay = 0,
  }) =>
      SlideInLeft(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInRight(
    int? milliseconds, {
    int delay = 0,
  }) =>
      SlideInRight(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Flip Animations
  Widget flipInX(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FlipInX(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget flipInY(
    int? milliseconds, {
    int delay = 0,
  }) =>
      FlipInY(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Zoom Animations
  Widget zoomIn(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ZoomIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget zoomOut(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ZoomOut(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Jello, Bounce, Dance, Flash Animations
  Widget jelloIn(
    int? milliseconds, {
    int delay = 0,
  }) =>
      JelloIn(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounce(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Bounce(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget dance(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Dance(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget flash(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Flash(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Pulse, Roulette, ShakeX, ShakeY, Spin Animations
  Widget pulse(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Pulse(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget roulette(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Roulette(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget shakeX(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ShakeX(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget shakeY(
    int? milliseconds, {
    int delay = 0,
  }) =>
      ShakeY(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget spin(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Spin(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget spinPerfect(
    int? milliseconds, {
    int delay = 0,
  }) =>
      SpinPerfect(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget swing(
    int? milliseconds, {
    int delay = 0,
  }) =>
      Swing(
        duration: Duration(milliseconds: milliseconds ?? 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );
}

extension PopupExtension on BuildContext {
  // Show a Snackbar using awesome_snackbar_content
  void showAwesomeSnackBar({
    required String message,
    ContentType type = ContentType.success,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: AwesomeSnackbarContent(
          title: 'Notification',
          message: message,
          contentType: type,
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // Show an AwesomeDialog
  Future<void> showAwesomeDialog({
    required String title,
    required String description,
    DialogType dialogType = DialogType.info,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return AwesomeDialog(
      context: this,
      dialogType: dialogType,
      animType: AnimType.scale,
      title: title,
      desc: description,
      btnOkText: confirmText,
      btnCancelText: cancelText,
      btnOkOnPress: onConfirm,
      btnCancelOnPress: onCancel,
    ).show();
  }

  // Show a BottomSheet using modal_bottom_sheet
  Future<void> showCustomBottomSheet({
    required Widget child,
    bool isDismissible = true,
    ShapeBorder? shape,
    Color? backgroundColor,
  }) {
    return showMaterialModalBottomSheet(
      context: this,
      isDismissible: isDismissible,
      shape: shape,
      backgroundColor: backgroundColor,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

  // Show a simple dialog with awesome_dialog
  Future<void> showSimpleDialog({
    required String title,
    required String description,
    String? buttonText,
    VoidCallback? onButtonPressed,
  }) {
    return AwesomeDialog(
      context: this,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: title,
      desc: description,
      btnOkText: buttonText,
      btnOkOnPress: onButtonPressed,
    ).show();
  }

  // Show a loading dialog with awesome_dialog
  Future<void> showLoadingDialog({
    String message = 'Loading...',
  }) {
    return AwesomeDialog(
      context: this,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: message,
      btnOk: Container(), // Hide the OK button
      dismissOnBackKeyPress: false,
    ).show();
  }

  // Show a confirmation dialog with awesome_dialog
  Future<bool> showConfirmationDialog({
    required String title,
    required String description,
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) {
    return AwesomeDialog(
      context: this,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: title,
      desc: description,
      btnOkText: confirmText,
      btnCancelText: cancelText,
      btnOkOnPress: () => Navigator.of(this).pop(true),
      btnCancelOnPress: () => Navigator.of(this).pop(false),
    ).show().then((value) => value ?? false);
  }
}
