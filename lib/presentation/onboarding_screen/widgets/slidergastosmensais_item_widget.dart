import '../controller/onboarding_controller.dart';
import '../models/slidergastosmensais_item_model.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

// ignore: must_be_immutable
class SlidergastosmensaisItemWidget extends StatelessWidget {
  SlidergastosmensaisItemWidget(this.slidergastosmensaisItemModelObj);

  SlidergastosmensaisItemModel slidergastosmensaisItemModelObj;

  var controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: AppDecoration.outlineBlack900191.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder3,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: getVerticalSize(
                  37.00,
                ),
                width: getHorizontalSize(
                  261.00,
                ),
                margin: getMargin(
                  top: 14,
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 27,
                          right: 27,
                          bottom: 10,
                        ),
                        child: Text(
                          "msg_gastos_mensais_por".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanSemiBold808,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: getVerticalSize(
                                  12.00,
                                ),
                                width: getHorizontalSize(
                                  14.00,
                                ),
                                margin: getMargin(
                                  left: 22,
                                  right: 22,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        height: getVerticalSize(
                                          12.00,
                                        ),
                                        width: getHorizontalSize(
                                          14.00,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.gray401,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              7.29,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: getPadding(
                                          left: 6,
                                          top: 2,
                                          right: 6,
                                          bottom: 2,
                                        ),
                                        child: CommonImageView(
                                          svgPath: ImageConstant.imgGroup5,
                                          height: getVerticalSize(
                                            8.00,
                                          ),
                                          width: getHorizontalSize(
                                            2.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: getPadding(
                                  left: 27,
                                  top: 1,
                                  right: 27,
                                ),
                                child: Text(
                                  "msg_gastos_do_m_s_de".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanRegular707,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: getVerticalSize(
                                  1.00,
                                ),
                                width: getHorizontalSize(
                                  261.00,
                                ),
                                margin: getMargin(
                                  top: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 24,
                top: 7,
                right: 22,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      bottom: 40,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 1,
                            ),
                            child: Text(
                              "lbl_120".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular606,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              top: 5,
                            ),
                            child: Text(
                              "lbl_100".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular606,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(
                              left: 2,
                              top: 5,
                            ),
                            child: Text(
                              "lbl_80".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular606,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(
                              left: 2,
                              top: 6,
                            ),
                            child: Text(
                              "lbl_60".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular606,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(
                              left: 2,
                              top: 5,
                            ),
                            child: Text(
                              "lbl_40".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular606,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getVerticalSize(
                      96.00,
                    ),
                    width: getHorizontalSize(
                      194.00,
                    ),
                    margin: getMargin(
                      left: 9,
                      top: 5,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: getMargin(
                              bottom: 10,
                            ),
                            decoration: AppDecoration.outlineGray200,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                  width: getHorizontalSize(
                                    194.00,
                                  ),
                                  margin: getMargin(
                                    top: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray200,
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                  width: getHorizontalSize(
                                    194.00,
                                  ),
                                  margin: getMargin(
                                    top: 13,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray200,
                                  ),
                                ),
                                Container(
                                  height: getVerticalSize(
                                    1.00,
                                  ),
                                  width: getHorizontalSize(
                                    194.00,
                                  ),
                                  margin: getMargin(
                                    top: 13,
                                    bottom: 42,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: getPadding(
                              left: 6,
                              top: 10,
                              right: 10,
                              bottom: 1,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: getVerticalSize(
                                      72.00,
                                    ),
                                    width: getHorizontalSize(
                                      18.00,
                                    ),
                                    margin: getMargin(
                                      left: 3,
                                      right: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blue900,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 6,
                                  ),
                                  child: Text(
                                    "lbl_mercado".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular628,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: getPadding(
                              left: 52,
                              top: 10,
                              right: 52,
                              bottom: 1,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    59.00,
                                  ),
                                  width: getHorizontalSize(
                                    18.00,
                                  ),
                                  margin: getMargin(
                                    left: 6,
                                    right: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.purple400,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      top: 5,
                                    ),
                                    child: Text(
                                      "lbl_farm_cia".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterRegular628,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: getHorizontalSize(
                              32.00,
                            ),
                            margin: getMargin(
                              left: 58,
                              top: 10,
                              right: 58,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    59.00,
                                  ),
                                  width: getHorizontalSize(
                                    18.00,
                                  ),
                                  margin: getMargin(
                                    left: 11,
                                    right: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.lime900,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: getPadding(
                                      top: 6,
                                    ),
                                    child: Text(
                                      "lbl_transporte".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterRegular628,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: getHorizontalSize(
                              21.00,
                            ),
                            margin: getMargin(
                              left: 11,
                              top: 10,
                              right: 11,
                              bottom: 1,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: getVerticalSize(
                                      59.00,
                                    ),
                                    width: getHorizontalSize(
                                      18.00,
                                    ),
                                    margin: getMargin(
                                      left: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.lightGreen200,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 6,
                                    right: 1,
                                  ),
                                  child: Text(
                                    "lbl_outros".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular628,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
