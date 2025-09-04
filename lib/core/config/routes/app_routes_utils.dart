part of 'routes.dart';

enum PAGES {
  splash, //
  home, //
  login, //
  register,
  detail, //
  videoPlayer,
}

extension AppScreenExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/splash";
      case PAGES.login:
        return "/login";
      case PAGES.register:
        return "/register";
      case PAGES.detail:
        return "/detail";
      case PAGES.videoPlayer:
        return '/video';
      case PAGES.home:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return "SPLASH";
      case PAGES.login:
        return "lOGIN";
      case PAGES.register:
        return "REGISTER";
      case PAGES.detail:
        return "DETAIL";
      case PAGES.videoPlayer:
        return "VIDEO";
      case PAGES.home:
        return "HOME";
    }
  }
}
