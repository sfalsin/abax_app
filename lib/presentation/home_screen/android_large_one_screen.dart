import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../helper.dart';
import '../home_screen/widgets/listlanguage_item_widget.dart';
import 'controller/android_large_one_controller.dart';
import 'models/listlanguage_item_model.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class AndroidLargeOneScreen extends GetWidget<AndroidLargeOneController> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(

        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/ranking_screen');
                      },
                      child: Container(
                          margin: getMargin(top: 10),
                          //decoration: AppDecoration.outlineBlack9003f,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 50, top: 17, right: 50),
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgTicket,
                                            height: getVerticalSize(23.00),
                                            width: getHorizontalSize(21.00)))),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 31,
                                            top: 5,
                                            right: 31,
                                            bottom: 13),
                                        child: Text("lbl_ranking".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanRegular12Lime900)))
                              ]))),
                  Padding(padding: getPadding(left: 4, top: 9, right: 4)),
                  GestureDetector(
                    onTap: () {
                      scanQR(context);
                    },
                    child: Container(
                      margin: getMargin(left: 0, bottom: 1),
                      decoration: AppDecoration.outlineBlack9003f1.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder38),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    getPadding(left: 12, top: 9, right: 12),
                                child: CommonImageView(
                                    svgPath: ImageConstant.imgQrcode,
                                    height: getSize(30.00),
                                    width: getSize(30.00))),
                            Padding(
                                padding: getPadding(
                                    left: 12, top: 5, right: 12, bottom: 11),
                                child: Text("lbl_cadastrar_nf".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtRobotoRomanRegular12WhiteA700))
                          ]),
                    ),
                  ),
                  Padding(padding: getPadding(left: 4, top: 9, right: 4)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/android_large_two_screen');
                      },
                      child: Container(
                          margin: getMargin(top: 10),
                          //decoration: AppDecoration.outlineBlack9003f,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 50, top: 17, right: 50),
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgVector,
                                            height: getVerticalSize(23.00),
                                            width: getHorizontalSize(21.00)))),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 31,
                                            top: 5,
                                            right: 31,
                                            bottom: 13),
                                        child: Text("lbl_gest_o_fin".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtRobotoRomanRegular12Lime900)))
                              ]))),
                ]),
            body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: getVerticalSize(279.00),
                      width: size.width,
                      child: Stack(alignment: Alignment.topLeft, children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                height: getVerticalSize(228.00),
                                width: size.width,
                                margin: getMargin(top: 10),
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: CommonImageView(
                                              imagePath: ImageConstant
                                                  .imgImage5228x360,
                                              height: getVerticalSize(228.00),
                                              width:
                                                  getHorizontalSize(360.00))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              width: getHorizontalSize(159.00),
                                              margin: getMargin(
                                                  left: 10,
                                                  top: 12,
                                                  bottom: 12),
                                              decoration: AppDecoration
                                                  .fillWhiteA700db
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .customBorderBL24),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                            padding: getPadding(
                                                                left: 15,
                                                                top: 11,
                                                                right: 14),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Card(
                                                                      clipBehavior:
                                                                          Clip
                                                                              .antiAlias,
                                                                      elevation:
                                                                          0,
                                                                      margin: EdgeInsets
                                                                          .all(
                                                                              0),
                                                                      shape: RoundedRectangleBorder(
                                                                          side: BorderSide(
                                                                              color: ColorConstant.lime900,
                                                                              width: getHorizontalSize(1.00)),
                                                                          borderRadius: BorderRadiusStyle.circleBorder13),
                                                                      child: Container(
                                                                          height: getSize(26.00),
                                                                          width: getSize(26.00),
                                                                          decoration: AppDecoration.outlineLime900.copyWith(borderRadius: BorderRadiusStyle.circleBorder13),
                                                                          child: Stack(children: [
                                                                            Align(
                                                                                alignment: Alignment.center,
                                                                                child: Padding(padding: getPadding(all: 5), child: CommonImageView(svgPath: ImageConstant.imgTicket, height: getSize(14.00), width: getSize(14.00))))
                                                                          ]))),
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          left:
                                                                              10,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                      child: Text(
                                                                          "lbl_ganhe_descontos"
                                                                              .tr,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style:
                                                                              AppStyle.txtRobotoRomanBold12))
                                                                ]))),
                                                    Container(
                                                        width:
                                                            getHorizontalSize(
                                                                121.00),
                                                        margin: getMargin(
                                                            left: 15,
                                                            top: 18,
                                                            right: 15,
                                                            bottom: 21),
                                                        child: Text(
                                                            "msg_cadastre_notas_fiscais"
                                                                .tr,
                                                            maxLines: null,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtRobotoRomanRegular12))
                                                  ])))
                                    ]))),
                        CustomAppBar(
                            height: getVerticalSize(64.00),
                            title: Container(
                                height: getVerticalSize(37.00),
                                width: getHorizontalSize(109.40),
                                margin: getMargin(left: 16),
                                child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      AppbarTitle(
                                          text: "lbl_a_bax".tr,
                                          margin: getMargin(left: 5)),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              height: getSize(36.00),
                                              width: getSize(36.00),
                                              margin: getMargin(right: 73),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              18.32)),
                                                  border: Border.all(
                                                      color:
                                                          ColorConstant.gray900,
                                                      width: getHorizontalSize(
                                                          1.12)))))
                                    ])),
                            actions: [
                              AppbarImage(
                                  height: getSize(32.00),
                                  width: getSize(32.00),
                                  svgPath: ImageConstant.imgMenu,
                                  margin: getMargin(all: 16),
                                  onTap: onTapMenu9)
                            ],
                            styleType: Style.bgFillLime900)
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding:
                                  getPadding(top: 18, right: 2, bottom: 93),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            getPadding(left: 24, right: 22),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width:
                                                      getHorizontalSize(68.00),
                                                  margin: getMargin(
                                                      top: 7, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray300)),
                                              Text("msg_veja_como_f_cil".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRobotoRomanBold16),
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width:
                                                      getHorizontalSize(68.00),
                                                  margin: getMargin(
                                                      top: 7, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray300))
                                            ])),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            height: getVerticalSize(110.00),
                                            width: getHorizontalSize(358.00),
                                            margin: getMargin(top: 19),
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Container(
                                                          margin: getMargin(
                                                              top: 10),
                                                          decoration:
                                                              AppDecoration
                                                                  .fillGray102,
                                                          child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        89.00),
                                                                    height: 40,
                                                                    margin: getMargin(
                                                                        left:
                                                                            30,
                                                                        top: 38,
                                                                        bottom:
                                                                            17),
                                                                    child: Text(
                                                                        "msg_clique_em_cadastrar"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: AppStyle
                                                                            .txtRobotoRomanRegular12Black900)),
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        89.00),
                                                                    height: 40,
                                                                    margin: getMargin(
                                                                        left:
                                                                            30,
                                                                        top: 38,
                                                                        bottom:
                                                                            17),
                                                                    child: Text(
                                                                        "msg_aponte_a_camera"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: AppStyle
                                                                            .txtRobotoRomanRegular12Black900)),
                                                                Container(
                                                                    width: getHorizontalSize(
                                                                        89.00),
                                                                    height: 40,
                                                                    margin: getMargin(
                                                                        left:
                                                                            22,
                                                                        top: 38,
                                                                        right:
                                                                            8,
                                                                        bottom:
                                                                            17),
                                                                    child: Text(
                                                                        "msg_pronto_agora"
                                                                            .tr,
                                                                        maxLines:
                                                                            null,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        style: AppStyle
                                                                            .txtRobotoRomanRegular12Black900))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 44,
                                                              right: 44,
                                                              bottom: 2),
                                                          padding: getPadding(
                                                              left: 14,
                                                              top: 2,
                                                              right: 14,
                                                              bottom: 2),
                                                          decoration: AppDecoration
                                                              .txtFillLime900
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCircleBorder24),
                                                          child: Text(
                                                              "lbl_1".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular3429))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 149,
                                                              right: 149,
                                                              bottom: 10),
                                                          padding: getPadding(
                                                              left: 14,
                                                              top: 3,
                                                              right: 14,
                                                              bottom: 3),
                                                          decoration: AppDecoration
                                                              .txtFillLime900
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCircleBorder24),
                                                          child: Text(
                                                              "lbl_2".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular3429))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 33,
                                                              right: 33,
                                                              bottom: 10),
                                                          padding: getPadding(
                                                              left: 14,
                                                              top: 3,
                                                              right: 14,
                                                              bottom: 3),
                                                          decoration: AppDecoration
                                                              .txtFillLime900
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtCircleBorder24),
                                                          child: Text(
                                                              "lbl_3".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtRobotoRomanRegular3429))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 126,
                                                              top: 20,
                                                              right: 126,
                                                              bottom: 20),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowrightBlack900,
                                                              height:
                                                                  getVerticalSize(
                                                                      9.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      4.00)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 128,
                                                              top: 20,
                                                              right: 128,
                                                              bottom: 20),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowrightBlack900,
                                                              height:
                                                                  getVerticalSize(
                                                                      9.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      4.00)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 109,
                                                              top: 20,
                                                              right: 109,
                                                              bottom: 20),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowrightBlack900,
                                                              height:
                                                                  getVerticalSize(
                                                                      9.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      4.00)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 107,
                                                              top: 20,
                                                              right: 107,
                                                              bottom: 20),
                                                          child: CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgArrowrightBlack900,
                                                              height:
                                                                  getVerticalSize(
                                                                      9.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      4.00))))
                                                ]))),
                                    Padding(
                                        padding: getPadding(
                                            left: 24, top: 30, right: 22),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width:
                                                      getHorizontalSize(68.00),
                                                  margin: getMargin(
                                                      top: 7, bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray300)),
                                              Padding(
                                                  padding: getPadding(left: 8),
                                                  child: Text(
                                                      "msg_premia_o_de_outubro"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtRobotoRomanBold16)),
                                              Container(
                                                  height: getVerticalSize(1.00),
                                                  width:
                                                      getHorizontalSize(68.00),
                                                  margin: getMargin(
                                                      left: 7,
                                                      top: 7,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .gray300))
                                            ])),
                                    Padding(
                                        padding: getPadding(
                                            left: 8, top: 15, right: 12),
                                        child: Obx(() => ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .androidLargeOneModelObj
                                                .value
                                                .listlanguageItemList
                                                .length,
                                            itemBuilder: (context, index) {
                                              ListlanguageItemModel model =
                                                  controller
                                                          .androidLargeOneModelObj
                                                          .value
                                                          .listlanguageItemList[
                                                      index];
                                              return ListlanguageItemWidget(
                                                  model);
                                            }))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            height: getVerticalSize(156.00),
                                            width: getHorizontalSize(358.00),
                                            margin: getMargin(top: 12),
                                            child: Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Container(
                                                          margin: getMargin(
                                                              left: 8,
                                                              right: 10,
                                                              bottom: 10),
                                                          decoration: AppDecoration
                                                              .fillLightgreen50
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder9),
                                                          child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                    margin: getMargin(
                                                                        left:
                                                                            13,
                                                                        top: 10,
                                                                        bottom:
                                                                            13),
                                                                    decoration: AppDecoration
                                                                        .fillWhiteA700
                                                                        .copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .roundedBorder31),
                                                                    child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize
                                                                                .min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                              width: getHorizontalSize(36.00),
                                                                              margin: getMargin(left: 14, top: 17, right: 13, bottom: 15),
                                                                              child: Text("lbl_3_lugar".tr, maxLines: null, textAlign: TextAlign.center, style: AppStyle.txtRobotoRomanBold14))
                                                                        ])),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left:
                                                                            12,
                                                                        top: 13,
                                                                        right:
                                                                            49,
                                                                        bottom:
                                                                            16),
                                                                    child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize
                                                                                .min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(right: 10),
                                                                              child: Text("msg_desconto_de_r_15_00".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanBold16)),
                                                                          Align(
                                                                              alignment: Alignment.center,
                                                                              child: Container(width: getHorizontalSize(200.00), margin: getMargin(top: 7), child: Text("msg_r_15_00_para_voc2".tr, maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular14)))
                                                                        ]))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Container(
                                                          height:
                                                              getVerticalSize(
                                                                  89.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  358.00),
                                                          margin: getMargin(
                                                              top: 10),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft,
                                                                    child: Container(
                                                                        margin: getMargin(top: 10),
                                                                        decoration: AppDecoration.outlineBlack9003f,
                                                                        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                          Align(
                                                                              alignment: Alignment.centerRight,
                                                                              child: Padding(padding: getPadding(left: 50, top: 17, right: 50), child: CommonImageView(svgPath: ImageConstant.imgVector, height: getVerticalSize(21.00), width: getHorizontalSize(23.00)))),
                                                                          Align(
                                                                              alignment: Alignment.centerRight,
                                                                              child: Padding(padding: getPadding(left: 31, top: 5, right: 31, bottom: 13), child: Text("lbl_gest_o_fin".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12Lime900)))
                                                                        ]))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Padding(
                                                                        padding: getPadding(left: 50, right: 50, bottom: 10),
                                                                        child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: [
                                                                          GestureDetector(
                                                                              onTap: () {
                                                                                onTapColumnticketone();
                                                                              },
                                                                              child: Padding(
                                                                                  padding: getPadding(top: 33),
                                                                                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                    Padding(padding: getPadding(left: 9, right: 9), child: CommonImageView(svgPath: ImageConstant.imgTicket, height: getSize(25.00), width: getSize(25.00))),
                                                                                    Align(alignment: Alignment.centerLeft, child: Padding(padding: getPadding(top: 6), child: Text("lbl_ranking".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12Lime900)))
                                                                                  ]))),
                                                                          Container(
                                                                              margin: getMargin(left: 54, bottom: 1),
                                                                              decoration: AppDecoration.outlineBlack9003f1.copyWith(borderRadius: BorderRadiusStyle.circleBorder38),
                                                                              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                Padding(padding: getPadding(left: 12, top: 9, right: 12), child: CommonImageView(svgPath: ImageConstant.imgQrcode, height: getSize(30.00), width: getSize(30.00))),
                                                                                Padding(padding: getPadding(left: 12, top: 5, right: 12, bottom: 11), child: Text("lbl_cadastrar_nf".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12WhiteA700))
                                                                              ]))
                                                                        ])))
                                                              ])))
                                                ])))
                                  ]))))
                ])));
  }

  onTapMenu9() {
    Get.toNamed(AppRoutes.menuScreen);
  }

  onTapColumnticketone() {
    Get.toNamed(AppRoutes.perfilMeuEndereOFiveScreen);
  }
}
