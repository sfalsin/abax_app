import 'controller/esqueci_minha_senha_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';

class EsqueciMinhaSenhaScreen extends GetWidget<EsqueciMinhaSenhaController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray101,
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
                      onTap: onTapMenu1)
                ],
                styleType: Style.bgFillLime900),
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                onTapReturn();
                              },
                              child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin:
                                      getMargin(left: 16, top: 24, right: 16),
                                  color: ColorConstant.gray101,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder18),
                                  child: Container(
                                      height: getSize(36.00),
                                      width: getSize(36.00),
                                      decoration: AppDecoration
                                          .outlineBlack90019
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder18),
                                      child: Stack(children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                                padding: getPadding(all: 8),
                                                child: InkWell(
                                                    onTap: () {
                                                      onTapImgArrowleft();
                                                    },
                                                    child: CommonImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowleft,
                                                        height: getSize(20.00),
                                                        width:
                                                            getSize(20.00)))))
                                      ]))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 25, right: 16),
                              child: Text("msg_c_digo_de_verifica_o".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold18Gray801
                                      .copyWith(height: 1.22)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: getHorizontalSize(292.00),
                              margin: getMargin(left: 16, top: 15, right: 16),
                              child: Text("msg_digite_o_c_digo".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16Gray800
                                      .copyWith(height: 1.13)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 25, right: 16),
                              child: Text("msg_c_digo_de_verifica_o".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21)))),
                      CustomTextFormField(
                          width: 328,
                          focusNode: FocusNode(),
                          controller: controller.inputSearchController,
                          hintText: "msg_digite_o_c_digo2".tr,
                          margin: getMargin(left: 16, top: 2, right: 16),
                          textInputAction: TextInputAction.done,
                          alignment: Alignment.center),
                      CustomButton(
                          width: 328,
                          text: "lbl_pr_ximo".tr,
                          margin: getMargin(
                              left: 16, top: 48, right: 16, bottom: 5),
                          onTap: onTapPrximo,
                          alignment: Alignment.center)
                    ])))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.esqueciMinhaSenhaOneScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapPrximo() {
    Get.toNamed(AppRoutes.cadastrarSenhaScreen);
  }

  onTapMenu1() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
