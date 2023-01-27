import 'controller/login_preenchido_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/core/utils/validation_functions.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_icon_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class LoginPreenchidoScreen extends GetWidget<LoginPreenchidoController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray101,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(77.00),
                                      width: getHorizontalSize(222.00),
                                      margin: getMargin(
                                          left: 15, top: 120, right: 15),
                                      child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                    padding: getPadding(
                                                        left: 10, bottom: 2),
                                                    child: Text("lbl_a_bax".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtAudiowideRegular5867))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                    height: getSize(74.00),
                                                    width: getSize(74.00),
                                                    margin: getMargin(
                                                        top: 2, right: 10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    37.35)),
                                                        border: Border.all(
                                                            color: ColorConstant
                                                                .lime900,
                                                            width:
                                                                getHorizontalSize(
                                                                    2.29)))))
                                          ]))),
                              Padding(
                                  padding:
                                      getPadding(left: 16, top: 44, right: 16),
                                  child: Text("msg_bem_vindo_de_volta".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold20
                                          .copyWith(height: 1.25))),
                              Padding(
                                  padding:
                                      getPadding(left: 15, top: 4, right: 15),
                                  child: Text("msg_fa_a_seu_login_para".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtInterMedium16Bluegray400
                                          .copyWith(height: 1.25))),
                              Padding(
                                  padding:
                                      getPadding(left: 16, top: 21, right: 16),
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
                                  margin:
                                      getMargin(left: 15, top: 3, right: 15),
                                  variant: TextFormFieldVariant.OutlineBlue500,
                                  fontStyle: TextFormFieldFontStyle
                                      .InterMedium14Gray804,
                                  alignment: Alignment.center,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              Padding(
                                  padding:
                                      getPadding(left: 16, top: 24, right: 16),
                                  child: Text("lbl_senha".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14Gray804
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.groupFiveController,
                                  margin:
                                      getMargin(left: 15, top: 3, right: 15),
                                  variant: TextFormFieldVariant.OutlineBlue500,
                                  textInputAction: TextInputAction.done,
                                  alignment: Alignment.center,
                                  isObscureText: true),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 20, top: 20, right: 20),
                                      child: Text("msg_esqueci_minha_senha".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold14
                                              .copyWith(height: 1.21)))),
                              CustomButton(
                                  width: 328,
                                  text: "lbl_entrar".tr,
                                  margin:
                                      getMargin(left: 15, top: 26, right: 15),
                                  onTap: onTapEntrar,
                                  alignment: Alignment.center),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(30.00),
                                      width: getHorizontalSize(328.00),
                                      margin: getMargin(
                                          left: 15, top: 24, right: 15),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                    height:
                                                        getVerticalSize(1.00),
                                                    width: getHorizontalSize(
                                                        328.00),
                                                    margin: getMargin(
                                                        top: 14, bottom: 14),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .gray400))),
                                            CustomButton(
                                                width: 128,
                                                text:
                                                    "msg_ou_conecte_se_com".tr,
                                                margin: getMargin(
                                                    left: 40, right: 40),
                                                variant:
                                                    ButtonVariant.FillGray101,
                                                shape: ButtonShape.Square,
                                                padding:
                                                    ButtonPadding.PaddingAll7,
                                                fontStyle: ButtonFontStyle
                                                    .InterRegular12,
                                                alignment: Alignment.center)
                                          ]))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 15, top: 16, right: 15),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomIconButton(
                                                height: 50,
                                                width: 50,
                                                onTap: () {
                                                  onTapBtntf();
                                                },
                                                child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgGoogle)),
                                            CustomIconButton(
                                                height: 50,
                                                width: 50,
                                                margin: getMargin(left: 40),
                                                onTap: () {
                                                  onTapBtntf1();
                                                },
                                                child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgFacebook))
                                          ]))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: getPadding(
                                          left: 15,
                                          top: 28,
                                          right: 15,
                                          bottom: 5),
                                      child: Text("msg_n_o_tem_uma_conta".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold14
                                              .copyWith(height: 1.21))))
                            ]))))));
  }

  onTapEntrar() {
    Get.toNamed(AppRoutes.androidLargeOneScreen);
  }

  onTapBtntf() async {
    var url = 'https://accounts.google.com/';
    if (!await launch(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }

  onTapBtntf1() async {
    var url = 'https://www.facebook.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://www.facebook.com/login/';
    }
  }
}
