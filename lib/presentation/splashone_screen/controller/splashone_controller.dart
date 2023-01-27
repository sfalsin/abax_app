import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/splashone_screen/models/splashone_model.dart';

class SplashoneController extends GetxController {
  Rx<SplashoneModel> splashoneModelObj = SplashoneModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(AppRoutes.onboardingOneScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
