import 'controller/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';

class PerfilScreen extends GetWidget<PerfilController> {
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
                      onTap: onTapMenu11)
                ],
                styleType: Style.bgFillLime900),
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: getVerticalSize(165.00),
                              width: size.width,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            height: getVerticalSize(114.00),
                                            width: size.width,
                                            margin: getMargin(bottom: 10),
                                            decoration: BoxDecoration(
                                                color: ColorConstant.gray900))),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin: getMargin(
                                                left: 109, top: 10, right: 109),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color:
                                                        ColorConstant.gray100,
                                                    width: getHorizontalSize(
                                                        6.00)),
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder70),
                                            child: Container(
                                                height: getSize(141.00),
                                                width: getSize(141.00),
                                                decoration: AppDecoration
                                                    .outlineGray100
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder70),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 10,
                                                                      right: 5),
                                                              child: CommonImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgPhoto,
                                                                  height:
                                                                      getVerticalSize(
                                                                          131.00),
                                                                  width: getHorizontalSize(
                                                                      136.00)))),
                                                      Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              elevation: 0,
                                                              margin: getMargin(
                                                                  left: 10,
                                                                  top: 10,
                                                                  right: 8,
                                                                  bottom: 8),
                                                              color:
                                                                  ColorConstant
                                                                      .blueA400,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder6),
                                                              child: Container(
                                                                  height:
                                                                      getSize(
                                                                          36.00),
                                                                  width: getSize(
                                                                      36.00),
                                                                  decoration: AppDecoration
                                                                      .fillBlueA400
                                                                      .copyWith(
                                                                          borderRadius: BorderRadiusStyle
                                                                              .roundedBorder6),
                                                                  child: Stack(
                                                                      children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child: Padding(padding: getPadding(all: 8), child: CommonImageView(svgPath: ImageConstant.imgEdit, height: getSize(20.00), width: getSize(20.00))))
                                                                      ]))))
                                                    ]))))
                                  ]))),
                      Padding(
                          padding: getPadding(left: 16, top: 22, right: 16),
                          child: Text("msg_joana_dos_santos".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold20Gray802
                                  .copyWith(height: 1.25))),
                      Container(
                          height: getVerticalSize(1.00),
                          width: getHorizontalSize(328.00),
                          margin: getMargin(left: 16, top: 24, right: 16),
                          decoration:
                              BoxDecoration(color: ColorConstant.gray4006c)),
                      GestureDetector(
                          onTap: () {
                            onTapRowminhaconta();
                          },
                          child: Container(
                              margin: getMargin(left: 16, top: 23, right: 16),
                              decoration: AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                            left: 16, top: 15, bottom: 16),
                                        child: Text("lbl_minha_conta".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold16
                                                .copyWith(height: 1.25))),
                                    Padding(
                                        padding: getPadding(
                                            top: 16, right: 16, bottom: 16),
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgArrowleft,
                                            height: getSize(20.00),
                                            width: getSize(20.00)))
                                  ]))),
                      GestureDetector(
                          onTap: () {
                            onTapRowmeuendereo();
                          },
                          child: Container(
                              margin: getMargin(left: 16, top: 24, right: 16),
                              decoration: AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                        padding: getPadding(
                                            left: 16, top: 17, bottom: 14),
                                        child: Text("lbl_meu_endere_o".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterSemiBold16
                                                .copyWith(height: 1.25))),
                                    Padding(
                                        padding: getPadding(
                                            top: 16, right: 16, bottom: 16),
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgArrowleft,
                                            height: getSize(20.00),
                                            width: getSize(20.00)))
                                  ]))),
                      Container(
                          margin: getMargin(left: 16, top: 24, right: 16),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding: getPadding(
                                        left: 16, top: 17, bottom: 14),
                                    child: Text("msg_central_de_ajuda".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterSemiBold16
                                            .copyWith(height: 1.25))),
                                Padding(
                                    padding: getPadding(
                                        top: 16, right: 16, bottom: 16),
                                    child: CommonImageView(
                                        svgPath: ImageConstant.imgArrowleft,
                                        height: getSize(20.00),
                                        width: getSize(20.00)))
                              ])),
                      CustomButton(
                          width: 328,
                          text: "lbl_sair_do_app".tr,
                          margin: getMargin(
                              left: 16, top: 149, right: 16, bottom: 5),
                          variant: ButtonVariant.OutlineGray801,
                          fontStyle: ButtonFontStyle.InterSemiBold14Gray801,
                          onTap: onTapSairdoapp)
                    ])))));
  }

  onTapRowminhaconta() {
    Get.toNamed(AppRoutes.perfilMinhaContaScreen);
  }

  onTapRowmeuendereo() {
    Get.toNamed(AppRoutes.perfilMeuEndereOTwoScreen);
  }

  onTapSairdoapp() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapMenu11() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
