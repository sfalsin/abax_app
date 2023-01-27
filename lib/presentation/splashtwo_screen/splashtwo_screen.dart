import 'controller/splashtwo_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

class SplashtwoScreen extends GetWidget<SplashtwoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                              child: InkWell(
                                  onTap: () {
                                    onTapImgElipse();
                                  },
                                  child: CommonImageView(
                                      imagePath: ImageConstant.imgElipse,
                                      height: getVerticalSize(800.00),
                                      width: getHorizontalSize(360.00))))))
                ])));
  }

  onTapImgElipse() {
    Get.toNamed(AppRoutes.splashthreeScreen);
  }
}
