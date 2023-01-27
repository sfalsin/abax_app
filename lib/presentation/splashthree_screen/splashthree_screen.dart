import 'controller/splashthree_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

class SplashthreeScreen extends GetWidget<SplashthreeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray901,
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                              child: Container(
                                  height: size.height,
                                  width: size.width,
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                                onTap: () {
                                                  onTapImgElipse();
                                                },
                                                child: CommonImageView(
                                                    imagePath: ImageConstant
                                                        .imgElipse800x360,
                                                    height:
                                                        getVerticalSize(800.00),
                                                    width: getHorizontalSize(
                                                        360.00)))),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                height: getVerticalSize(77.00),
                                                width:
                                                    getHorizontalSize(222.00),
                                                margin: getMargin(
                                                    left: 69,
                                                    top: 342,
                                                    right: 69,
                                                    bottom: 342),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 10,
                                                                      bottom:
                                                                          2),
                                                              child: Text(
                                                                  "lbl_a_bax"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtAudiowideRegular5867))),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                              height: getSize(
                                                                  74.00),
                                                              width: getSize(
                                                                  74.00),
                                                              margin: getMargin(
                                                                  top: 2,
                                                                  right: 10),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          getHorizontalSize(
                                                                              37.35)),
                                                                  border: Border.all(
                                                                      color: ColorConstant
                                                                          .lime900,
                                                                      width: getHorizontalSize(
                                                                          2.29)))))
                                                    ])))
                                      ])))))
                ])));
  }

  onTapImgElipse() {
    Get.toNamed(AppRoutes.onboardingOneScreen);
  }
}
