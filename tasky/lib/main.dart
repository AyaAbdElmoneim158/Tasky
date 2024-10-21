import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/helpers/bloc_observer.dart';
import 'injection_container.dart' as di;
import 'tasky_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();

  await di.init();
  runApp(const TaskyApp());
}
