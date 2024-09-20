import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/constants/strings.dart';
import 'core/utils/routing/router.dart';
import 'core/utils/routing/routes.dart';
import 'core/utils/routing/screen_routing.dart';
import 'core/utils/theme/theme.dart';
// import 'package:flutter_offline/flutter_offline.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          //! Theme ----------------------------------------------------------------------
          theme: AppAppTheme.lightTheme,
          themeMode: ThemeMode.light,
          //! Route ----------------------------------------------------------------------
          onGenerateRoute: AppRouter.onGenerate,
          initialRoute: AppRoutes.initRoute,
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (_) => const NotFoundPage(),
          ),
        /*  builder: (context, child) {
            return OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                List<ConnectivityResult> connectivity,
                Widget child,
              ) {
                // ignore: unrelated_type_equality_checks
                final bool connected = connectivity != ConnectivityResult.none;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    child, // The main app UI
                    if (!connected) buildNoConnectionScreen(context),
                  ],
                );
              },
              child: child ?? Container(),
            );
          },*/
        );
      },
    );
  }
}
