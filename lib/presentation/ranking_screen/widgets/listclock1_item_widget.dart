import '../controller/ranking_controller.dart';
import '../models/listclock1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

// ignore: must_be_immutable
class Listclock1ItemWidget extends StatelessWidget {
  Listclock1ItemWidget(this.listclock1ItemModelObj);

  Listclock1ItemModel listclock1ItemModelObj;

  var controller = Get.find<RankingController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 5.0,
          bottom: 5.0,
        ),
        decoration: AppDecoration.outlineBlack9003f2.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder9,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 18,
                top: 12,
                bottom: 12,
              ),
              child: CommonImageView(
                svgPath: ImageConstant.imgClock,
                height: getVerticalSize(
                  51.00,
                ),
                width: getHorizontalSize(
                  52.00,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 11,
                top: 15,
                bottom: 9,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "msg_maria_jos_da_silva".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold14Black900.copyWith(
                      height: 1.21,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 9,
                      right: 10,
                    ),
                    child: Text(
                      "lbl_1258pts".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold20Black900.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 41,
                top: 6,
                right: 15,
                bottom: 9,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    30.50,
                  ),
                ),
                child: CommonImageView(
                  imagePath: ImageConstant.imgEllipse20,
                  height: getSize(
                    61.00,
                  ),
                  width: getSize(
                    61.00,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
