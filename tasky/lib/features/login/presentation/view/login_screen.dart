import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../core/shared/widgets/art_image.dart';
import '../../../../injection_container.dart';
import '../view_model/login_cubit.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const ArtImage().zoomIn(),
                const LoginForm(),
              ],
            ),
          ),
        ));
  }
}
