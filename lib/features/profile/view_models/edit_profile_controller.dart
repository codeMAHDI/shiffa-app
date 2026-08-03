import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController(text: 'John smith');
  final TextEditingController dobController = TextEditingController(text: '28/11/1997');
  final TextEditingController countryController = TextEditingController(text: 'United States');
  final TextEditingController phoneController = TextEditingController(text: '+1234567890');

  void saveProfile() {
    // Save logic
    Get.back();
    Get.snackbar('Success', 'Profile updated successfully', snackPosition: SnackPosition.BOTTOM);
  }
}
