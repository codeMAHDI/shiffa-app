import 'package:get/get.dart';
import '../view_models/client_dashboard_controller.dart';
import '../../client_home/view_models/client_home_controller.dart';

class ClientDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientDashboardController>(() => ClientDashboardController());
    Get.lazyPut<ClientHomeController>(() => ClientHomeController(), fenix: true);
  }
}
