import 'package:get/get.dart';

class PractitionerProfileController extends GetxController {
  final RxList<String> selectedSkills = <String>[].obs;
  final RxList<String> selectedLanguages = <String>['English', 'Arabic'].obs; // Default selections based on design
  final RxBool isTermsAccepted = false.obs;
  
  final List<String> availableSkills = [
    'Sihr & Jinn specialist',
    'EVIL EYE',
    'Spiritual Counseling',
    'Mental Health',
    'Family & Marriage',
    'Childhood Ruqyah',
  ];

  @override
  void onInit() {
    super.onInit();
    // Default selected skills based on design
    selectedSkills.addAll(['Sihr & Jinn specialist', 'Spiritual Counseling']);
  }

  void toggleSkill(String skill) {
    if (selectedSkills.contains(skill)) {
      selectedSkills.remove(skill);
    } else {
      selectedSkills.add(skill);
    }
  }
  
  void toggleTerms(bool? value) {
    isTermsAccepted.value = value ?? false;
  }
}
