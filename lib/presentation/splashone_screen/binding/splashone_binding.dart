import '../controller/splashone_controller.dart';
import 'package:get/get.dart';

class SplashoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashoneController());
  }
}
