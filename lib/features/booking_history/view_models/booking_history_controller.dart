import 'package:get/get.dart';
import '../../client_home/models/practitioner_model.dart';

class BookingHistoryModel {
  final String id;
  final PractitionerModel practitioner;
  final String date;
  final String time;
  final double fee;
  final String status; // 'Confirmed', 'Completed', 'Canceled'

  BookingHistoryModel({
    required this.id,
    required this.practitioner,
    required this.date,
    required this.time,
    required this.fee,
    required this.status,
  });
}

class BookingHistoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late final RxList<BookingHistoryModel> activeBookings = <BookingHistoryModel>[].obs;
  late final RxList<BookingHistoryModel> pastBookings = <BookingHistoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    final mockPractitioner = PractitionerModel(
      id: '1',
      name: 'Sheikh Ahmed Al-Mansoor',
      imageUrl: 'assets/images/practitioner_image.png',
      rating: 4.9,
      location: 'UAE',
      languages: 'Arabic, English',
      tags: ['Sihr & Jinn specialist'],
      pricePerSession: 75.0,
      isVerified: true,
    );

    activeBookings.value = [
      BookingHistoryModel(
        id: '101',
        practitioner: mockPractitioner,
        date: 'Sun, 22 Oct 2026',
        time: '10:30 AM',
        fee: 80.0,
        status: 'Confirmed',
      ),
      BookingHistoryModel(
        id: '102',
        practitioner: mockPractitioner,
        date: 'Sun, 22 Oct 2026',
        time: '10:30 AM',
        fee: 120.0,
        status: 'Confirmed',
      ),
    ];

    pastBookings.value = [
      BookingHistoryModel(
        id: '201',
        practitioner: mockPractitioner,
        date: 'Sun, 22 Oct 2026',
        time: '10:30 AM',
        fee: 80.0,
        status: 'Canceled',
      ),
      BookingHistoryModel(
        id: '202',
        practitioner: mockPractitioner,
        date: 'Sun, 22 Oct 2026',
        time: '10:30 AM',
        fee: 80.0,
        status: 'Completed',
      ),
    ];
  }
}
