import 'package:get/get.dart';
import '../../client_home/models/practitioner_model.dart';
import '../../../../core/app_routes/app_routes.dart';

class SecurePaymentController extends GetxController {
  late final PractitionerModel practitioner;
  late final int selectedDate;
  late final String selectedTime;

  var selectedPaymentMethod = 'stripe_paypal'.obs; // Default selected

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
        tags: ['Sihr & Jinn specialist'],
        pricePerSession: 75.0,
      );
      selectedDate = 15;
      selectedTime = '09:00 AM';
    }
  }

  void payNow() {
    // Process payment here
    Get.toNamed(AppRoutes.bookingConfirmed, arguments: {
      'practitioner': practitioner,
      'date': selectedDate,
      'time': selectedTime,
    });
  }
}
