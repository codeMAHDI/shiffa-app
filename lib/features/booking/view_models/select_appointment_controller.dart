import 'package:get/get.dart';
import '../../client_home/models/practitioner_model.dart';
import '../../../../core/app_routes/app_routes.dart';

class SelectAppointmentController extends GetxController {
  late final PractitionerModel practitioner;

  var selectedDate = 15.obs; // Default to 15th for mockup
  var selectedTime = '09:00 AM'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is PractitionerModel) {
      practitioner = Get.arguments as PractitionerModel;
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
    }
  }

  void selectDate(int date) {
    selectedDate.value = date;
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }

  void continueToPayment() {
    Get.toNamed(AppRoutes.bookingSummary, arguments: {
      'practitioner': practitioner,
      'date': selectedDate.value,
      'time': selectedTime.value,
    });
  }
}
