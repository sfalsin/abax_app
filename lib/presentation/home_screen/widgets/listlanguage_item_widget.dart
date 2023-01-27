import '../controller/android_large_one_controller.dart';
import '../models/listlanguage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

// ignore: must_be_immutable
class ListlanguageItemWidget extends StatelessWidget {
  ListlanguageItemWidget(this.listlanguageItemModelObj);

  ListlanguageItemModel listlanguageItemModelObj;

  var controller = Get.find<AndroidLargeOneController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 6.0,
        bottom: 6.0,
      ),
      decoration: AppDecoration.fillLightgreen50.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder9,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: getMargin(
              left: 13,
              top: 10,
              bottom: 13,
            ),
            decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder31,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(
                    36.00,
                  ),
                  margin: getMargin(
                    left: 14,
                    top: 18,
                    right: 13,
                    bottom: 14,
                  ),
                  child: Text(
                    "lbl_1_lugar".tr,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtRobotoRomanBold14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 12,
              top: 13,
              right: 41,
              bottom: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    right: 10,
                  ),
                  child: Text(
                    "msg_desconto_de_r_150_00".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRomanBold16,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: getHorizontalSize(
                      208.00,
                    ),
                    margin: getMargin(
                      top: 7,
                    ),
                    child: Text(
                      "msg_r_150_00_para_voc".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoRomanRegular14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
