import 'controller/splashone_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

class SplashoneScreen extends GetWidget<SplashoneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: GestureDetector(
                        onTap: () {
                          onTapSplashOne();
                        },
                        child: Container(
                            height: size.height, width: size.width))))));
  }

  onTapSplashOne() {
    Get.toNamed(AppRoutes.splashtwoScreen);
  }
}
