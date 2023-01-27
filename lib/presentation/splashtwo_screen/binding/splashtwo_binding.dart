import '../controller/splashtwo_controller.dart';
import 'package:get/get.dart';

class SplashtwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashtwoController());
  }
}
