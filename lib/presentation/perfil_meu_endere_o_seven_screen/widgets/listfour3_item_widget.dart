import '../controller/perfil_meu_endere_o_seven_controller.dart';
import '../models/listfour3_item_model.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';

// ignore: must_be_immutable
class Listfour3ItemWidget extends StatelessWidget {
  Listfour3ItemWidget(this.listfour3ItemModelObj);

  Listfour3ItemModel listfour3ItemModelObj;

  var controller = Get.find<PerfilMeuEndereOSevenController>();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 23,
                top: 11,
                bottom: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 8,
                      bottom: 9,
                    ),
                    child: Text(
                      "lbl_4".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold20Black900.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 20,
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
                              "lbl_jos_da_silva".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                                  AppStyle.txtInterSemiBold14Black900.copyWith(
                                height: 1.21,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 8,
                            right: 10,
                          ),
                          child: Text(
                            "lbl_1200pts".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold14Black900.copyWith(
                              height: 1.21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 106,
                top: 8,
                right: 23,
                bottom: 12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    22.00,
                  ),
                ),
                child: CommonImageView(
                  imagePath: ImageConstant.imgEllipse17,
                  height: getSize(
                    44.00,
                  ),
                  width: getSize(
                    44.00,
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
