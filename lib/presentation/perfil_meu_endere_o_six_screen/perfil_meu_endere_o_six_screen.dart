import 'controller/perfil_meu_endere_o_six_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';

class PerfilMeuEndereOSixScreen
    extends GetWidget<PerfilMeuEndereOSixController> {
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
                      onTap: onTapMenu19)
                ],
                styleType: Style.bgFillLime900),
            body: SingleChildScrollView(
                child: Padding(
                    padding:
                        getPadding(left: 15, top: 24, right: 16, bottom: 5),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(left: 1, right: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                    borderRadius:
                                                        BorderRadiusStyle
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
                                                              padding:
                                                                  getPadding(
                                                                      all: 8),
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    onTapImgArrowleft();
                                                                  },
                                                                  child: CommonImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgArrowleft,
                                                                      height: getSize(
                                                                          20.00),
                                                                      width: getSize(
                                                                          20.00)))))
                                                    ])))),
                                        Padding(
                                            padding: getPadding(
                                                left: 42, top: 7, bottom: 3),
                                            child: Text(
                                                "msg_detalhe_do_cupon".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterSemiBold20Gray802
                                                    .copyWith(height: 1.25)))
                                      ]))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 15, top: 32, right: 15),
                                  child: CommonImageView(
                                      imagePath: ImageConstant.imgGroup20,
                                      height: getVerticalSize(103.00),
                                      width: getHorizontalSize(137.00)))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 15, top: 1, right: 15),
                                  child: Text("msg_desconto_de_r_15_00".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanBold16))),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: getHorizontalSize(291.00),
                                  margin:
                                      getMargin(left: 15, top: 17, right: 15),
                                  child: Text("msg_voc_ganhou_15_reais".tr,
                                      maxLines: null,
                                      textAlign: TextAlign.center,
                                      style:
                                          AppStyle.txtRobotoRomanRegular14))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 1, top: 52, right: 10),
                                  child: Text("lbl_regras".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanBold16))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 15, top: 23, right: 15),
                                  child: Text("msg_valido_para_todos".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtRobotoRomanRegular14))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 15, top: 8, right: 15),
                                  child: Text("msg_valido_at_dia_23_04_2024".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtRobotoRomanRegular14))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 15, top: 8, right: 15),
                                  child: Text("msg_n_o_d_direito_a".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style:
                                          AppStyle.txtRobotoRomanRegular14))),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: double.infinity,
                                  margin: getMargin(top: 27),
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder13),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: getPadding(
                                                left: 44, top: 25, right: 43),
                                            child: Text(
                                                "msg_para_usar_o_seu".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular14)),
                                        Padding(
                                            padding: getPadding(
                                                left: 44,
                                                top: 29,
                                                right: 44,
                                                bottom: 5),
                                            child: Text("lbl_54546213".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtRobotoRomanRegular48))
                                      ])))
                        ])))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapMenu19() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
