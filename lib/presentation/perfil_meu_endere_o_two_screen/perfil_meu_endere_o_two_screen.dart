import 'controller/perfil_meu_endere_o_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';

class PerfilMeuEndereOTwoScreen
    extends GetWidget<PerfilMeuEndereOTwoController> {
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
                      onTap: onTapMenu13)
                ],
                styleType: Style.bgFillLime900),
            body: SingleChildScrollView(
                child: Padding(
                    padding:
                        getPadding(left: 16, top: 24, right: 16, bottom: 5),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: getPadding(right: 10),
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
                                            left: 58, top: 7, bottom: 3),
                                        child: Text("lbl_meu_endere_o".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtInterSemiBold20Gray802
                                                .copyWith(height: 1.25)))
                                  ])),
                          Padding(
                              padding: getPadding(top: 25, right: 10),
                              child: Text("lbl_endere_o".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold18Gray801
                                      .copyWith(height: 1.22))),
                          Padding(
                              padding: getPadding(top: 20, right: 10),
                              child: Text("lbl_cep".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller: controller.inputSearchController,
                              hintText: "lbl_29102_111".tr,
                              margin: getMargin(top: 3),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802),
                          Padding(
                              padding: getPadding(top: 24, right: 10),
                              child: Text("lbl_estado".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller: controller.inputSearchOneController,
                              hintText: "lbl_esp_rito_santo".tr,
                              margin: getMargin(top: 3),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802),
                          Padding(
                              padding: getPadding(top: 24, right: 10),
                              child: Text("lbl_cidade".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller: controller.inputSearchTwoController,
                              hintText: "lbl_vit_ria".tr,
                              margin: getMargin(top: 3),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802),
                          Padding(
                              padding: getPadding(top: 24, right: 10),
                              child: Text("lbl_bairro".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller: controller.inputSearchThreeController,
                              hintText: "lbl_jardim_da_penha".tr,
                              margin: getMargin(top: 3),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802),
                          Padding(
                              padding: getPadding(top: 25, right: 10),
                              child: Text("lbl_endere_o".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller: controller.inputSearchFourController,
                              hintText: "msg_avenida_anisio_fernandes".tr,
                              margin: getMargin(top: 2),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802),
                          Padding(
                              padding: getPadding(top: 24, right: 10),
                              child: Text("lbl_n_mero".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller: controller.inputSearchFiveController,
                              hintText: "lbl_751".tr,
                              margin: getMargin(top: 3),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802),
                          Padding(
                              padding: getPadding(top: 25, right: 10),
                              child: Text("lbl_complemento".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21))),
                          CustomTextFormField(
                              width: 328,
                              focusNode: FocusNode(),
                              controller:
                                  controller.apartamentoCounterController,
                              hintText: "lbl_apartamento_403".tr,
                              margin: getMargin(top: 2),
                              variant: TextFormFieldVariant.OutlineGray802,
                              fontStyle:
                                  TextFormFieldFontStyle.InterMedium14Gray802,
                              textInputAction: TextInputAction.done),
                          CustomButton(
                              width: 328,
                              text: "msg_salvar_altera_es".tr,
                              margin: getMargin(top: 72))
                        ])))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapMenu13() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
