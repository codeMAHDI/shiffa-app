import 'package:get/get.dart';
import '../view_models/client_home_controller.dart';

class ClientHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientHomeController>(() => ClientHomeController());
  }
}
