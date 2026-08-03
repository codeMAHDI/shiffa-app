import 'package:get/get.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_screen.dart';

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
