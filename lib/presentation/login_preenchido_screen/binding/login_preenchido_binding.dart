import '../controller/login_preenchido_controller.dart';
import 'package:get/get.dart';

class LoginPreenchidoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPreenchidoController());
  }
}
