import 'package:get/get.dart';

class AdvancedFiltersController extends GetxController {
  // Language Options
  final List<String> languages = ['English', 'Arabic', 'Somali'];
  var selectedLanguage = 'English'.obs;

  // Specialties Options
  final List<String> specialties = [
    'Evil Eye', 'Jinn', 'Sihr', 'Marriage',
    'Family', 'Children', 'Anxiety', 'Depression'
  ];
  var selectedSpecialty = 'Evil Eye'.obs;

  // Availability Options
  final List<String> availabilityOptions = ['Today', 'Tomorrow', 'This Week'];
  var selectedAvailability = 'Tomorrow'.obs;

  // Price Range
  var priceRange = 20.0.obs; // Slider value between 0 and 200

  // Verified Only Switch
  var verifiedOnly = true.obs;

  void applyFilters() {
    // Perform any filtering logic here...
    Get.back(); // Pop back to Search Screen
  }

  void clearFilters() {
    selectedLanguage.value = 'English';
    selectedSpecialty.value = 'Evil Eye';
    selectedAvailability.value = 'Tomorrow';
    priceRange.value = 20.0;
    verifiedOnly.value = true;
  }
}
