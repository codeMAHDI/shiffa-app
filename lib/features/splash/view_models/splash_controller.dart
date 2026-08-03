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
      
      // TODO: Navigate to the next screen (e.g., Auth or Home)
      // Get.offAllNamed(AppRoutes.homeScreen);
    } catch (e) {
      print("Error during initialization: $e");
    }
  }
}
