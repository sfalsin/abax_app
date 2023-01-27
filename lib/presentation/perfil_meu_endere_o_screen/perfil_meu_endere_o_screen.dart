import 'controller/perfil_meu_endere_o_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';

class PerfilMeuEndereOScreen extends GetWidget<PerfilMeuEndereOController> {
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
                      onTap: onTapMenu18)
                ],
                styleType: Style.bgFillLime900),
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: getPadding(
                            left: 11, top: 24, right: 11, bottom: 390),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(left: 5, right: 10),
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
                                                left: 90, top: 7, bottom: 3),
                                            child: Text("lbl_cupons".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterSemiBold20Gray802
                                                    .copyWith(height: 1.25)))
                                      ])),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowprice();
                                  },
                                  child: Container(
                                      margin: getMargin(top: 53),
                                      decoration: AppDecoration.fillLightgreen50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder9),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: getMargin(
                                                    top: 10, bottom: 15),
                                                color: ColorConstant.whiteA700,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder31),
                                                child: Container(
                                                    height: getSize(63.00),
                                                    width: getSize(63.00),
                                                    decoration: AppDecoration
                                                        .fillWhiteA700
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder31),
                                                    child: Stack(children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .center,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 7,
                                                                      top: 14,
                                                                      right: 8,
                                                                      bottom:
                                                                          13),
                                                              child: CommonImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgGroup20,
                                                                  height:
                                                                      getVerticalSize(
                                                                          36.00),
                                                                  width: getHorizontalSize(
                                                                      48.00))))
                                                    ]))),
                                            Padding(
                                                padding: getPadding(
                                                    top: 13, bottom: 18),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              right: 10),
                                                          child: Text(
                                                              "msg_desconto_de_r_15_00"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanBold16)),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  232.00),
                                                          margin:
                                                              getMargin(top: 5),
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
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        200.00),
                                                                    margin:
                                                                        getMargin(
                                                                            top:
                                                                                1),
                                                                    child: Text(
                                                                        "msg_r_15_00_para_voc"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtRobotoRomanRegular14)),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        bottom:
                                                                            19),
                                                                    child: CommonImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgArrowright,
                                                                        height: getVerticalSize(
                                                                            12.00),
                                                                        width: getHorizontalSize(
                                                                            6.00)))
                                                              ]))
                                                    ]))
                                          ]))),
                              GestureDetector(
                                  onTap: () {
                                    onTapRowpricetwo();
                                  },
                                  child: Container(
                                      margin: getMargin(top: 8),
                                      decoration: AppDecoration.fillLightgreen50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder9),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: getMargin(
                                                    top: 10, bottom: 15),
                                                color: ColorConstant.whiteA700,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder31),
                                                child: Container(
                                                    height: getSize(63.00),
                                                    width: getSize(63.00),
                                                    decoration: AppDecoration
                                                        .fillWhiteA700
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder31),
                                                    child: Stack(children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .center,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 7,
                                                                      top: 14,
                                                                      right: 8,
                                                                      bottom:
                                                                          13),
                                                              child: CommonImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgGroup20,
                                                                  height:
                                                                      getVerticalSize(
                                                                          36.00),
                                                                  width: getHorizontalSize(
                                                                      48.00))))
                                                    ]))),
                                            Padding(
                                                padding: getPadding(
                                                    top: 13, bottom: 18),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              right: 10),
                                                          child: Text(
                                                              "msg_desconto_de_r_15_00"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanBold16)),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  232.00),
                                                          margin:
                                                              getMargin(top: 5),
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
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        200.00),
                                                                    margin:
                                                                        getMargin(
                                                                            top:
                                                                                1),
                                                                    child: Text(
                                                                        "msg_r_15_00_para_voc"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtRobotoRomanRegular14)),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        bottom:
                                                                            19),
                                                                    child: CommonImageView(
                                                                        svgPath:
                                                                            ImageConstant
                                                                                .imgArrowright,
                                                                        height: getVerticalSize(
                                                                            12.00),
                                                                        width: getHorizontalSize(
                                                                            6.00)))
                                                              ]))
                                                    ]))
                                          ]))),
                              Container(
                                  margin: getMargin(top: 8),
                                  decoration: AppDecoration.fillLightgreen50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder9),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin:
                                                getMargin(top: 10, bottom: 15),
                                            color: ColorConstant.whiteA700,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder31),
                                            child: Container(
                                                height: getSize(63.00),
                                                width: getSize(63.00),
                                                decoration: AppDecoration
                                                    .fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder31),
                                                child: Stack(children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 7,
                                                              top: 14,
                                                              right: 8,
                                                              bottom: 13),
                                                          child: CommonImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgGroup20,
                                                              height:
                                                                  getVerticalSize(
                                                                      36.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      48.00))))
                                                ]))),
                                        Padding(
                                            padding:
                                                getPadding(top: 13, bottom: 18),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(right: 10),
                                                      child: Text(
                                                          "msg_desconto_de_r_15_00"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanBold16)),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          232.00),
                                                      margin: getMargin(top: 5),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        200.00),
                                                                margin: getMargin(
                                                                    top: 1),
                                                                child: Text(
                                                                    "msg_r_15_00_para_voc"
                                                                        .tr,
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanRegular14)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            19),
                                                                child: CommonImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowright,
                                                                    height:
                                                                        getVerticalSize(
                                                                            12.00),
                                                                    width: getHorizontalSize(
                                                                        6.00)))
                                                          ]))
                                                ]))
                                      ])),
                              Container(
                                  margin: getMargin(top: 8),
                                  decoration: AppDecoration.fillLightgreen50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder9),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            margin:
                                                getMargin(top: 10, bottom: 15),
                                            color: ColorConstant.whiteA700,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder31),
                                            child: Container(
                                                height: getSize(63.00),
                                                width: getSize(63.00),
                                                decoration: AppDecoration
                                                    .fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder31),
                                                child: Stack(children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 7,
                                                              top: 14,
                                                              right: 8,
                                                              bottom: 13),
                                                          child: CommonImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgGroup20,
                                                              height:
                                                                  getVerticalSize(
                                                                      36.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      48.00))))
                                                ]))),
                                        Padding(
                                            padding:
                                                getPadding(top: 13, bottom: 18),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(right: 10),
                                                      child: Text(
                                                          "msg_desconto_de_r_15_00"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoRomanBold16)),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          232.00),
                                                      margin: getMargin(top: 5),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        200.00),
                                                                margin: getMargin(
                                                                    top: 1),
                                                                child: Text(
                                                                    "msg_r_15_00_para_voc"
                                                                        .tr,
                                                                    maxLines:
                                                                        null,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtRobotoRomanRegular14)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            19),
                                                                child: CommonImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowright,
                                                                    height:
                                                                        getVerticalSize(
                                                                            12.00),
                                                                    width: getHorizontalSize(
                                                                        6.00)))
                                                          ]))
                                                ]))
                                      ]))
                            ]))))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapRowprice() {
    Get.toNamed(AppRoutes.perfilMeuEndereOSixScreen);
  }

  onTapRowpricetwo() {
    Get.toNamed(AppRoutes.perfilMeuEndereOThreeScreen);
  }

  onTapMenu18() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
