import 'package:flutter/material.dart';

import '../constants/images.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SplashView"),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("LoginView"),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.image404,
              width: 250,
            ),
            const SizedBox(height: 12),
            Text(
              'Sorry, this page was not found',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF83839c),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        return Stack(
          fit: StackFit.expand,
          children: [
            child,  // Main Splash View UI
            if (!connected) _buildNoConnectionScreen(),  // No internet connection screen
          ],
        );
      },
      child: Scaffold(
        body: Center(
          child: Text(
            "Splash View",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
 */
// No internet connection screen for SplashView
Widget buildNoConnectionScreen(context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.noInternet,
            width: 250,
          ),
          const SizedBox(height: 12),
          Text(
            'No Internet Connection',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: const Color(0xFF83839c),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    ),
  );
}
