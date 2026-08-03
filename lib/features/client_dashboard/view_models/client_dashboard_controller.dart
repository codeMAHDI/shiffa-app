import 'package:get/get.dart';
import '../../client_home/view_models/client_home_controller.dart';

class ClientDashboardController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
