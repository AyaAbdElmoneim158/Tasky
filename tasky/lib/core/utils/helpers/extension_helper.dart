import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart';

// Extension on Widget to add all animations from animate_do
extension AnimateExtension on Widget {
  // FadeIn Animations
  Widget fadeIn({
    Duration? duration,
    int delay = 0,
    bool manualTrigger = false,
  }) =>
      FadeIn(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        manualTrigger: manualTrigger,
        child: this,
      );

  Widget fadeInDown({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInDown(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInDownBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInDownBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInUp({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInUp(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInUpBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInUpBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInLeft({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInLeft(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInLeftBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInLeftBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInRight({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInRight(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInRightBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeInRightBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // FadeOut Animations
  Widget fadeOut({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOut(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutDown({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutDown(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutDownBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutDownBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutUp({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutUp(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutUpBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutUpBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutLeft({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutLeft(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutLeftBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutLeftBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutRight({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutRight(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutRightBig({
    Duration? duration,
    int delay = 0,
  }) =>
      FadeOutRightBig(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Bounce Animations
  Widget bounceInDown({
    Duration? duration,
    int delay = 0,
  }) =>
      BounceInDown(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInUp({
    Duration? duration,
    int delay = 0,
  }) =>
      BounceInUp(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInLeft({
    Duration? duration,
    int delay = 0,
  }) =>
      BounceInLeft(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInRight({
    Duration? duration,
    int delay = 0,
  }) =>
      BounceInRight(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Elastic Animations
  Widget elasticIn({
    Duration? duration,
    int delay = 0,
  }) =>
      ElasticIn(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInDown({
    Duration? duration,
    int delay = 0,
  }) =>
      ElasticInDown(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInUp({
    Duration? duration,
    int delay = 0,
  }) =>
      ElasticInUp(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInLeft({
    Duration? duration,
    int delay = 0,
  }) =>
      ElasticInLeft(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInRight({
    Duration? duration,
    int delay = 0,
  }) =>
      ElasticInRight(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // SlideIn Animations
  Widget slideInDown({
    Duration? duration,
    int delay = 0,
  }) =>
      SlideInDown(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInUp({
    Duration? duration,
    int delay = 0,
  }) =>
      SlideInUp(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInLeft({
    Duration? duration,
    int delay = 0,
  }) =>
      SlideInLeft(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInRight({
    Duration? duration,
    int delay = 0,
  }) =>
      SlideInRight(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Flip Animations
  Widget flipInX({
    Duration? duration,
    int delay = 0,
  }) =>
      FlipInX(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget flipInY({
    Duration? duration,
    int delay = 0,
  }) =>
      FlipInY(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Zoom Animations
  Widget zoomIn({
    Duration? duration,
    int delay = 0,
  }) =>
      ZoomIn(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget zoomOut({
    Duration? duration,
    int delay = 0,
  }) =>
      ZoomOut(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Jello, Bounce, Dance, Flash Animations
  Widget jelloIn({
    Duration? duration,
    int delay = 0,
  }) =>
      JelloIn(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounce({
    Duration? duration,
    int delay = 0,
  }) =>
      Bounce(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget dance({
    Duration? duration,
    int delay = 0,
  }) =>
      Dance(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget flash({
    Duration? duration,
    int delay = 0,
  }) =>
      Flash(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Pulse, Roulette, ShakeX, ShakeY, Spin Animations
  Widget pulse({
    Duration? duration,
    int delay = 0,
  }) =>
      Pulse(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget roulette({
    Duration? duration,
    int delay = 0,
  }) =>
      Roulette(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget shakeX({
    Duration? duration,
    int delay = 0,
  }) =>
      ShakeX(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget shakeY({
    Duration? duration,
    int delay = 0,
  }) =>
      ShakeY(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget spin({
    Duration? duration,
    int delay = 0,
  }) =>
      Spin(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget spinPerfect({
    Duration? duration,
    int delay = 0,
  }) =>
      SpinPerfect(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget swing({
    Duration? duration,
    int delay = 0,
  }) =>
      Swing(
        duration: duration ?? const Duration(milliseconds: 500),
        delay: Duration(milliseconds: delay),
        child: this,
      );
}
