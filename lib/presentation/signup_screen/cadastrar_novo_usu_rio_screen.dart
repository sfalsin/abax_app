import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/user_service.dart';
import 'controller/cadastrar_novo_usu_rio_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/core/utils/validation_functions.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CadastrarNovoUsuRioScreen
    extends GetWidget<CadastrarNovoUsuRioController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User _user = User();
  final userService = UserService(userPool);

  void submit(BuildContext context) async {
    _formKey.currentState?.save();

    String message;
    var signUpSuccess = false;
    if (_user.email != null && _user.password != null && _user.name != null) {
      try {
        _user = await userService.signUp(_user.email!, _user.password!, _user.name!);
        signUpSuccess = true;
        message = 'User sign up successful!';
      } on CognitoClientException catch (e) {
        if (e.code == 'UsernameExistsException' ||
            e.code == 'InvalidParameterException' ||
            e.code == 'InvalidPasswordException' ||
            e.code == 'ResourceNotFoundException') {
          message = e.message ?? e.code ?? e.toString();
        } else {
          message = 'Unknown client error occurred';
        }
      } catch (e) {
        message = 'Unknown error occurred';
      }
    } else {
      message = 'Missing required attributes on user';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          if (signUpSuccess) {
            if (!_user.confirmed) {
              Navigator.pushNamed(context, '/c_digo_do_celular_screen',arguments:_user.email);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ConfirmationScreen(email: _user.email!)),
              // );
            }
          }
        },
      ),
      duration: Duration(seconds: 30),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                      onTap: onTapMenu3)
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
                              GestureDetector(
                                  onTap: () {
                                    onTapReturn();
                                  },
                                  child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: getMargin(right: 10),
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
                                                  borderRadius:
                                                      BorderRadiusStyle
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
                                                            height:
                                                                getSize(20.00),
                                                            width: getSize(
                                                                20.00)))))
                                          ])))),
                              Padding(
                                  padding: getPadding(top: 23, right: 10),
                                  child: Text("msg_cadastrar_novo_usu_rio".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold18Gray801
                                          .copyWith(height: 1.22))),
                              Padding(
                                  padding: getPadding(top: 17, right: 10),
                                  child: Text("msg_informe_os_dados".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium16Gray800
                                          .copyWith(height: 1.25))),
                              Padding(
                                  padding: getPadding(top: 27, right: 10),
                                  child: Text("lbl_nome".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.inputSearchController,
                                  hintText: "msg_digite_o_seu_nome".tr,
                                  margin: getMargin(top: 3)),
                              Padding(
                                  padding: getPadding(top: 24, right: 10),
                                  child: Text("lbl_cpf".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.inputSearchOneController,
                                  hintText: "msg_digite_o_seu_cpf".tr,
                                  margin: getMargin(top: 3)),
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
                                  controller:
                                      controller.inputSearchTwoController,
                                  hintText: "msg_digite_a_sua_data".tr,
                                  margin: getMargin(top: 3)),
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
                                      controller.inputSearchThreeController,
                                  hintText: "msg_digite_o_seu_telefone".tr,
                                  margin: getMargin(top: 3)),
                              Padding(
                                  padding: getPadding(top: 24, right: 10),
                                  child: Text("lbl_email".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller:
                                      controller.inputSearchFourController,
                                  hintText: "msg_digite_o_seu_email".tr,
                                  margin: getMargin(top: 3),
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              CustomButton(
                                  width: 328,
                                  text: "lbl_pr_ximo".tr,
                                  margin: getMargin(top: 72),
                                  onTap: onTapPrximo)
                            ]))))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapPrximo() {
    Get.toNamed(AppRoutes.cadastrarSenhaOneScreen);
  }

  onTapMenu3() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
