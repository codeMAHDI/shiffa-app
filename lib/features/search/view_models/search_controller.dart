import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../client_home/models/practitioner_model.dart';

class SearchController extends GetxController {
  final TextEditingController searchInputController = TextEditingController();

  final List<String> popularSpecialties = [
    'Evil Eye',
    'Sihr',
    'Jinn',
    'Anxiety',
    'Depression',
  ];

  var selectedSpecialty = 'Evil Eye'.obs;

  var searchResults = <PractitionerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadDummyResults();
  }

  void _loadDummyResults() {
    searchResults.value = [
      PractitionerModel(
        id: '1',
        name: 'Sheikh Ahmed Al-Mansoor',
        imageUrl: 'assets/images/practitioner_image.png',
        rating: 4.9,
        reviewsCount: 482,
        location: 'Online',
        languages: 'Arabic, English',
        tags: ['Sihr & Jinn specialist', 'Spiritual Counseling', '15+ Years Exp.'],
        pricePerSession: 75.0,
        isVerified: true,
        availabilityText: 'Available Today',
        isAvailableToday: true,
      ),
      PractitionerModel(
        id: '2',
        name: 'Dr. Mariam Al-Farsi',
        imageUrl: 'assets/images/practitioner_image.png',
        rating: 5.0,
        reviewsCount: 215,
        location: 'Online',
        languages: 'English, Urdu',
        tags: ['Family & Marriage', 'Childhood Ruqyah', '8+ Years Exp.'],
        pricePerSession: 90.0,
        isVerified: true,
        availabilityText: 'Next Available: Mon',
        isAvailableToday: false,
      ),
    ];
  }

  void selectSpecialty(String specialty) {
    selectedSpecialty.value = specialty;
    // Here you would normally filter the results based on specialty
  }
}
