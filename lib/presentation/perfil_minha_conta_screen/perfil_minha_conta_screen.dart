import 'controller/perfil_minha_conta_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/core/utils/validation_functions.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PerfilMinhaContaScreen extends GetWidget<PerfilMinhaContaController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      onTap: onTapMenu12)
                ],
                styleType: Style.bgFillLime900),
            body: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                left: 68, top: 4, bottom: 6),
                                            child: Text("lbl_minha_conta".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterSemiBold20Gray802
                                                    .copyWith(height: 1.25)))
                                      ])),
                              Padding(
                                  padding: getPadding(top: 41, right: 10),
                                  child: Text("msg_informa_es_pessoais".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold18Gray801
                                          .copyWith(height: 1.22))),
                              Padding(
                                  padding: getPadding(top: 21, right: 10),
                                  child: Text("msg_nome_e_sobrenome".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.inputSearchController,
                                  hintText: "msg_joana_dos_santos".tr,
                                  margin: getMargin(top: 3),
                                  variant: TextFormFieldVariant.OutlineGray301,
                                  fontStyle: TextFormFieldFontStyle
                                      .InterMedium14Gray801),
                              Padding(
                                  padding: getPadding(top: 24, right: 10),
                                  child: Text("lbl_email".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14Gray804
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.emailController,
                                  hintText: "msg_joanasantos_gmail_com".tr,
                                  margin: getMargin(top: 3),
                                  variant: TextFormFieldVariant.OutlineBlue500,
                                  fontStyle: TextFormFieldFontStyle
                                      .InterMedium14Gray804,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              Padding(
                                  padding: getPadding(top: 24, right: 10),
                                  child: Text("lbl_confirmar_email".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14Gray804
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.emailOneController,
                                  hintText: "msg_joanasantos_gmail_com".tr,
                                  margin: getMargin(top: 3),
                                  variant: TextFormFieldVariant.OutlineBlue500,
                                  fontStyle: TextFormFieldFontStyle
                                      .InterMedium14Gray804,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              Padding(
                                  padding: getPadding(top: 24, right: 10),
                                  child: Text("lbl_telefone".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.inputSearchOneController,
                                  hintText: "lbl_27_99877_5644".tr,
                                  margin: getMargin(top: 3),
                                  variant: TextFormFieldVariant.OutlineGray301,
                                  fontStyle: TextFormFieldFontStyle
                                      .InterMedium14Gray801),
                              Padding(
                                  padding: getPadding(top: 24, right: 10),
                                  child: Text("msg_data_de_nascimento".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.dateController,
                                  hintText: "lbl_20_12_1992".tr,
                                  margin: getMargin(top: 3),
                                  variant: TextFormFieldVariant.OutlineGray301,
                                  fontStyle: TextFormFieldFontStyle
                                      .InterMedium14Gray801),
                              Padding(
                                  padding: getPadding(top: 47, right: 10),
                                  child: Text("lbl_alterar_senha".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold18Gray801
                                          .copyWith(height: 1.22))),
                              Padding(
                                  padding: getPadding(top: 22, right: 10),
                                  child: Text("lbl_senha".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.inputSearchTwoController,
                                  hintText: "lbl_digite_a_senha".tr,
                                  margin: getMargin(top: 3)),
                              Padding(
                                  padding: getPadding(top: 36, right: 10),
                                  child: Text("msg_digite_a_senha_novamente".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.inputSearchThreeController,
                                  hintText: "lbl_repita_a_senha".tr,
                                  margin: getMargin(top: 2),
                                  textInputAction: TextInputAction.done),
                              CustomButton(
                                  width: 328,
                                  text: "msg_salvar_altera_es".tr,
                                  margin: getMargin(top: 72),
                                  onTap: onTapSalvaralteraes)
                            ]))))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapSalvaralteraes() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapMenu12() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
