import '../perfil_meu_endere_o_five_screen/widgets/listclock_item_widget.dart';
import '../perfil_meu_endere_o_five_screen/widgets/listfour_item_widget.dart';
import 'controller/perfil_meu_endere_o_five_controller.dart';
import 'models/listclock_item_model.dart';
import 'models/listfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';

class PerfilMeuEndereOFiveScreen
    extends GetWidget<PerfilMeuEndereOFiveController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                height: getVerticalSize(64.00),
                title: Container(
                    height: getVerticalSize(37.00),
                    width: getHorizontalSize(109.40),
                    margin: getMargin(left: 15),
                    child: Stack(alignment: Alignment.centerLeft, children: [
                      AppbarTitle(
                          text: "lbl_a_bax".tr, margin: getMargin(left: 5)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: getSize(36.00),
                              width: getSize(36.00),
                              margin: getMargin(right: 73),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(18.32)),
                                  border: Border.all(
                                      color: ColorConstant.gray900,
                                      width: getHorizontalSize(1.12)))))
                    ])),
                actions: [
                  AppbarImage(
                      height: getSize(32.00),
                      width: getSize(32.00),
                      svgPath: ImageConstant.imgMenu,
                      margin:
                          getMargin(left: 17, top: 16, right: 17, bottom: 16),
                      onTap: onTapMenu14)
                ],
                styleType: Style.bgFillLime900),
            body: SingleChildScrollView(
                child: Padding(
                    padding: getPadding(top: 24),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(left: 16, right: 16),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          onTapReturn();
                                        },
                                        child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: EdgeInsets.all(0),
                                            color: ColorConstant.gray101,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder18),
                                            child: Container(
                                                height: getSize(36.00),
                                                width: getSize(36.00),
                                                decoration: AppDecoration
                                                    .outlineBlack90019
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .circleBorder18),
                                                child: Stack(children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              all: 8),
                                                          child: InkWell(
                                                              onTap: () {
                                                                onTapImgArrowleft();
                                                              },
                                                              child: CommonImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgArrowleft,
                                                                  height:
                                                                      getSize(
                                                                          20.00),
                                                                  width: getSize(
                                                                      20.00)))))
                                                ])))),
                                    Padding(
                                        padding: getPadding(
                                            left: 89, top: 7, bottom: 3),
                                        child: Text("lbl_ranking".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtInterSemiBold20Gray802
                                                .copyWith(height: 1.25)))
                                  ])),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 14, top: 31, right: 14),
                                  child: Obx(() => ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller
                                          .perfilMeuEndereOFiveModelObj
                                          .value
                                          .listclockItemList
                                          .length,
                                      itemBuilder: (context, index) {
                                        ListclockItemModel model = controller
                                            .perfilMeuEndereOFiveModelObj
                                            .value
                                            .listclockItemList[index];
                                        return ListclockItemWidget(model);
                                      })))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 14, top: 10, right: 14),
                                  child: Obx(() => ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller
                                          .perfilMeuEndereOFiveModelObj
                                          .value
                                          .listfourItemList
                                          .length,
                                      itemBuilder: (context, index) {
                                        ListfourItemModel model = controller
                                            .perfilMeuEndereOFiveModelObj
                                            .value
                                            .listfourItemList[index];
                                        return ListfourItemWidget(model);
                                      })))),
                          Padding(
                              padding: getPadding(left: 58, top: 90, right: 58),
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgVectorWhiteA701,
                                  height: getVerticalSize(3.00),
                                  width: getHorizontalSize(2.00))),
                          Container(
                              width: double.infinity,
                              decoration: AppDecoration.outlineBlack9003f3
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderTL15),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                            left: 17, top: 19, right: 17),
                                        child: Text("lbl_parab_ns".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold2508
                                                .copyWith(height: 1.24))),
                                    Container(
                                        width: getHorizontalSize(314.00),
                                        margin: getMargin(
                                            left: 17, top: 35, right: 17),
                                        child: Text("msg_voc_ficou_em_1".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            style: AppStyle
                                                .txtInterSemiBold14Black900
                                                .copyWith(height: 1.71))),
                                    CustomButton(
                                        width: 328,
                                        text: "lbl_resgatar".tr,
                                        margin: getMargin(
                                            left: 17,
                                            top: 34,
                                            right: 15,
                                            bottom: 5),
                                        onTap: onTapResgatar)
                                  ]))
                        ])))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapResgatar() {
    Get.toNamed(AppRoutes.perfilMeuEndereOFourScreen);
  }

  onTapMenu14() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
