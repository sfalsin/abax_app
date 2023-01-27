import '../controller/c_digo_do_celular_controller.dart';
import 'package:get/get.dart';

class CDigoDoCelularBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CDigoDoCelularController());
  }
}
