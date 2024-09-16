import 'package:flutter/widgets.dart';
import 'package:animate_do/animate_do.dart';

// Extension on Widget to add all animations from animate_do
extension AnimateExtension on Widget {
  // FadeIn Animations
  Widget fadeIn({
    int milliseconds = 500,
    int delay = 0,
    bool manualTrigger = false,
  }) =>
      FadeIn(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        manualTrigger: manualTrigger,
        child: this,
      );

  Widget fadeInDown({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInDown(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInDownBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInDownBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInUp({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInUp(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInUpBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInUpBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInLeft({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInLeft(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInLeftBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInLeftBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInRight({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInRight(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeInRightBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeInRightBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // FadeOut Animations
  Widget fadeOut({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOut(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutDown({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutDown(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutDownBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutDownBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutUp({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutUp(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutUpBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutUpBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutLeft({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutLeft(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutLeftBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutLeftBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutRight({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutRight(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget fadeOutRightBig({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FadeOutRightBig(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Bounce Animations
  Widget bounceInDown({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      BounceInDown(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInUp({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      BounceInUp(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInLeft({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      BounceInLeft(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounceInRight({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      BounceInRight(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Elastic Animations
  Widget elasticIn({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ElasticIn(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInDown({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ElasticInDown(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInUp({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ElasticInUp(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInLeft({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ElasticInLeft(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget elasticInRight({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ElasticInRight(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // SlideIn Animations
  Widget slideInDown({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      SlideInDown(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInUp({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      SlideInUp(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInLeft({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      SlideInLeft(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget slideInRight({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      SlideInRight(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Flip Animations
  Widget flipInX({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FlipInX(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget flipInY({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      FlipInY(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Zoom Animations
  Widget zoomIn({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ZoomIn(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget zoomOut({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ZoomOut(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Jello, Bounce, Dance, Flash Animations
  Widget jelloIn({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      JelloIn(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget bounce({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Bounce(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget dance({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Dance(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget flash({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Flash(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  // Pulse, Roulette, ShakeX, ShakeY, Spin Animations
  Widget pulse({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Pulse(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget roulette({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Roulette(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget shakeX({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ShakeX(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget shakeY({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      ShakeY(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget spin({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Spin(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget spinPerfect({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      SpinPerfect(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );

  Widget swing({
    int milliseconds = 500,
    int delay = 0,
  }) =>
      Swing(
        duration: Duration(milliseconds: milliseconds),
        delay: Duration(milliseconds: delay),
        child: this,
      );
}
