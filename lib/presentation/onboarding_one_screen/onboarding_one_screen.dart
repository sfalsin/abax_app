import 'controller/onboarding_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_icon_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOneScreen extends GetWidget<OnboardingOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray101,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(left: 16, top: 47, right: 16),
                              child: Text("lbl_pular".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold18
                                      .copyWith(height: 1.22)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: getVerticalSize(236.00),
                              width: size.width,
                              margin: getMargin(top: 28),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                            padding: getPadding(bottom: 10),
                                            child: CommonImageView(
                                                imagePath:
                                                    ImageConstant.imgImage5,
                                                height: getVerticalSize(203.00),
                                                width: getHorizontalSize(
                                                    360.00)))),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            margin: getMargin(
                                                left: 64, top: 10, right: 64),
                                            decoration: AppDecoration
                                                .fillLightgreen50
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder6),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 6,
                                                          right: 10),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            CustomIconButton(
                                                                height: 42,
                                                                width: 42,
                                                                shape: IconButtonShape
                                                                    .CircleBorder21,
                                                                padding:
                                                                    IconButtonPadding
                                                                        .PaddingAll4,
                                                                child: CommonImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgGroup20)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 8,
                                                                        top: 2,
                                                                        bottom:
                                                                            1),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              right:
                                                                                  10),
                                                                          child: Text(
                                                                              "msg_desconto_de_r_15_00".tr,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtRobotoRomanBold1091)),
                                                                      Container(
                                                                          width: getHorizontalSize(
                                                                              136.00),
                                                                          margin: getMargin(
                                                                              top:
                                                                                  5),
                                                                          child: Text(
                                                                              "msg_r_15_00_para_voc".tr,
                                                                              maxLines: null,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtRobotoRomanRegular955))
                                                                    ]))
                                                          ])),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 8,
                                                              top: 5,
                                                              right: 6),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        top: 2,
                                                                        bottom:
                                                                            3),
                                                                    child: Container(
                                                                        height: getVerticalSize(
                                                                            5.00),
                                                                        width: getHorizontalSize(
                                                                            180.00),
                                                                        child: ClipRRect(
                                                                            child:
                                                                                LinearProgressIndicator(value: 0)))),
                                                                Text(
                                                                    "lbl_15_50"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanRegular955Black900)
                                                              ]))),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 5,
                                                          right: 10),
                                                      child: Text(
                                                          "msg_cadastre_mais_35"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanLight818)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 7,
                                                          right: 10,
                                                          bottom: 8),
                                                      child: Text(
                                                          "msg_20_cupons_dispon_veis"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanBold818))
                                                ])))
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(6.00),
                              margin: getMargin(left: 16, top: 63, right: 16),
                              child: SmoothIndicator(
                                  offset: 0,
                                  count: 2,
                                  axisDirection: Axis.horizontal,
                                  effect: ScrollingDotsEffect(
                                      spacing: 8,
                                      activeDotColor: ColorConstant.blueA400,
                                      dotColor: ColorConstant.gray400,
                                      dotHeight: getVerticalSize(6.00),
                                      dotWidth: getHorizontalSize(6.00))))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 16, top: 40, right: 16),
                              child: Text("msg_sempre_um_cupom".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold20
                                      .copyWith(height: 1.25)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: getHorizontalSize(292.00),
                              margin: getMargin(left: 16, top: 24, right: 16),
                              child: Text("msg_cadastre_notas_ou".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16
                                      .copyWith(height: 1.13)))),
                      CustomButton(
                          width: 328,
                          text: "lbl_pr_ximo".tr,
                          margin: getMargin(
                              left: 16, top: 163, right: 16, bottom: 5),
                          onTap: onTapPrximo,
                          alignment: Alignment.center)
                    ])))));
  }

  onTapPrximo() {
    Get.toNamed(AppRoutes.onboardingScreen);
  }
}
