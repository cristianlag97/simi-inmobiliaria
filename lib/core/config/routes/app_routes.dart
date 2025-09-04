part of 'routes.dart';

class AppRoutes {
  AppRoutes._();

  static final router = GoRouter(
    initialLocation: PAGES.splash.screenPath,
    routes: [
      GoRoute(
        path: PAGES.splash.screenPath,
        name: PAGES.splash.screenName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: PAGES.login.screenPath,
        name: PAGES.login.screenName,
        builder: (context, state) => const LoginScreen(),
      ),
      // GoRoute(
      //   path: PAGES.home.screenPath,
      //   name: PAGES.home.screenName,
      //   builder: (context, state) => const HomeScreen(),
      // ),
      GoRoute(
        path: PAGES.videoPlayer.screenPath,
        name: PAGES.videoPlayer.screenName,
        builder: (context, state) {
          final controller = state.extra as VideoPlayerController;
          return VideoScreen(controller: controller);
        },
      ),
      // GoRoute(
      //   path: PAGES.detail.screenPath,
      //   name: PAGES.detail.screenName,
      //   builder: (context, state) {
      //     final extra = state.extra as ChartDetailArgs;
      //     final tipo = extra.tipo;
      //     final seccion = extra.seccion;
      //     final data = extra.data;
      //     return DetailScreen(tipo: tipo, seccion: seccion, data: data);
      //   },
      // ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
