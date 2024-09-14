import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("Change detected: $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("Bloc closed: $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("Bloc created: $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint("Error in $bloc: $error\nStackTrace: $stackTrace");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint("Event received in $bloc: $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("Transition in $bloc: $transition");
  }
}
