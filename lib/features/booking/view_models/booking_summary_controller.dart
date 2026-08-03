import 'package:get/get.dart';
import '../../client_home/models/practitioner_model.dart';
import '../../../../core/app_routes/app_routes.dart';

class BookingSummaryController extends GetxController {
  late final PractitionerModel practitioner;
  late final int selectedDate;
  late final String selectedTime;

  var acceptedTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      practitioner = args['practitioner'];
      selectedDate = args['date'];
      selectedTime = args['time'];
    } else {
      // Fallback mockup
      practitioner = PractitionerModel(
        id: '1',
        name: 'Sheikh Ahmed Al-Mansoor',
        imageUrl: 'assets/images/practitioner_image.png',
        rating: 4.9,
        location: 'Online',
        languages: 'Arabic, English',
        tags: ['Sihr & Jinn specialist', 'Spiritual Counseling'],
        pricePerSession: 75.0,
        isVerified: true,
      );
      selectedDate = 15;
      selectedTime = '09:00 AM';
    }
  }

  void proceedToPayment() {
    if (!acceptedTerms.value) {
      Get.snackbar('Terms Required', 'Please agree to the booking policy and terms of service.');
      return;
    }
    
    Get.toNamed(AppRoutes.securePayment, arguments: {
      'practitioner': practitioner,
      'date': selectedDate,
      'time': selectedTime,
    });
  }
}
