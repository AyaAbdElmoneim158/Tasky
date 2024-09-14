import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/helpers/bloc_observer.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  runApp(const App());
}
