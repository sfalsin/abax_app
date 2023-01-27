import '../controller/splashthree_controller.dart';
import 'package:get/get.dart';

class SplashthreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashthreeController());
  }
}
