import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';

class OnboardingController extends GetxController {
  // State for language selection
  final RxString selectedLanguage = 'English'.obs;

  // State for role selection
  final RxString selectedRole = ''.obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }

  void continueFromLanguage() {
    Get.toNamed(AppRoutes.introScreen);
  }

  void getStarted() {
    Get.toNamed(AppRoutes.roleSelectionScreen);
  }

  void selectRole(String role) {
    selectedRole.value = role;
    print("Selected Role: $role");
    Future.delayed(const Duration(milliseconds: 500), () {
      if (role == 'Client') {
        Get.offAllNamed(AppRoutes.authScreen);
      } else if (role == 'Practitioner') {
        Get.toNamed(AppRoutes.practitionerSetup);
      }
    });
  }
}
