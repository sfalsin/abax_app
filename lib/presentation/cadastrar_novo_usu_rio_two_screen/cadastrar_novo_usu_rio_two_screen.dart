import 'controller/cadastrar_novo_usu_rio_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';

class CadastrarNovoUsuRioTwoScreen
    extends GetWidget<CadastrarNovoUsuRioTwoController> {
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
                      onTap: onTapMenu5)
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
                              padding: getPadding(left: 16, top: 23, right: 16),
                              child: Text("lbl_adicionar_foto".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold18Gray801
                                      .copyWith(height: 1.22)))),
                      Align(
                          alignment: Alignment.center,
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: getMargin(left: 16, top: 22, right: 16),
                              color: ColorConstant.gray201,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorConstant.gray403,
                                      width: getHorizontalSize(1.00)),
                                  borderRadius: BorderRadiusStyle
                                      .circleBorder76),
                              child: Container(
                                  height: getSize(152.00),
                                  width: getSize(152.00),
                                  decoration: AppDecoration.outlineGray403
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder76),
                                  child: Stack(children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                            padding: getPadding(all: 12),
                                            child: CommonImageView(
                                                svgPath: ImageConstant
                                                    .imgIconoutline12,
                                                height: getSize(128.00),
                                                width: getSize(128.00))))
                                  ])))),
                      CustomButton(
                          width: 328,
                          text: "lbl_adicionar_foto".tr,
                          margin: getMargin(left: 16, top: 24, right: 16),
                          variant: ButtonVariant.OutlineGray50019,
                          fontStyle: ButtonFontStyle.InterSemiBold14Gray802,
                          prefixWidget: Container(
                              margin: getMargin(right: 8),
                              child: CommonImageView(
                                  svgPath: ImageConstant.imgPlus)),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 24, right: 16),
                              child: Text("msg_recomenda_es_para".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold14Gray800
                                      .copyWith(height: 1.21)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 14, right: 16),
                              child: Text("msg_formatos_suportados".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14Gray800
                                      .copyWith(height: 1.21)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 15, right: 16),
                              child: Text("msg_resolu_o_sugerida".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14Gray800
                                      .copyWith(height: 1.21)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 14, right: 16),
                              child: Text("msg_tamanho_m_ximo".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14Gray800
                                      .copyWith(height: 1.21)))),
                      CustomButton(
                          width: 328,
                          text: "lbl_pr_ximo".tr,
                          margin: getMargin(left: 16, top: 82, right: 16),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(
                                  left: 16, top: 30, right: 16, bottom: 5),
                              child: Text("msg_fazer_isso_depois".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold14
                                      .copyWith(height: 1.21))))
                    ])))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.cadastrarNovoUsuRioOneScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapMenu5() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
