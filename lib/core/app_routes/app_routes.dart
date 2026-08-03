import 'package:get/get.dart';

class AppRoutes {
  /// ==================== INITIAL & AUTH ROUTES ====================
  static const String splashScreen = "/splash_screen";

  /// ==================== SHARED ROUTES (Profile & Chat) ====================


  static List<GetPage> routes = [
    /// ==================== INITIAL & AUTH PAGES ====================
    GetPage(name: splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),


    /// ==================== SHARED PAGES (Profile & Chat) ====================

  ];
}
