import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Simulate initialization/loading time
      await Future.delayed(const Duration(seconds: 3));
      
      // Navigate to Onboarding
      Get.offAllNamed(AppRoutes.languageSelectionScreen);
    } catch (e) {
      print("Error during initialization: $e");
    }
  }
}
