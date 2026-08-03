import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/practitioner_model.dart';
import '../../../../core/app_routes/app_routes.dart';

class ClientHomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  
  final RxList<PractitionerModel> recommendedPractitioners = <PractitionerModel>[].obs;
  final RxList<PractitionerModel> popularPractitioners = <PractitionerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    recommendedPractitioners.value = [
      PractitionerModel(
        id: '1',
        name: 'Sheikh Omar Al-Farsi',
        imageUrl: '', // We'll use a placeholder colored container
        rating: 4.9,
        location: 'UAE',
        languages: 'English, Arabic',
        tags: ['GENERAL RUQYAH', 'EVIL EYE'],
        pricePerSession: 50.0,
      ),
      PractitionerModel(
        id: '2',
        name: 'Dr. Ahmad Saeed',
        imageUrl: '',
        rating: 5.0,
        location: 'KSA',
        languages: 'Arabic',
        tags: ['SPIRITUAL HEALING'],
        pricePerSession: 50.0,
      ),
    ];

    popularPractitioners.value = [
      PractitionerModel(
        id: '3',
        name: 'Ustadha Amina Bakir',
        imageUrl: '',
        rating: 4.8,
        location: 'Jordan',
        languages: '',
        experience: '15+ Yrs Exp.',
        tags: [],
        pricePerSession: 50.0,
        isPopular: true,
      ),
      PractitionerModel(
        id: '4',
        name: 'Sheikh Zaid Mansour',
        imageUrl: '',
        rating: 4.9,
        location: 'Kuwait',
        languages: '',
        experience: '8 Yrs Exp.',
        tags: [],
        pricePerSession: 35.0,
        isPopular: true,
      ),
    ];
  }

  void onBookNow(PractitionerModel practitioner) {
    Get.toNamed(AppRoutes.selectAppointment, arguments: practitioner);
  }
}
