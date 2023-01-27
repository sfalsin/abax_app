import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/user_service.dart';
import 'controller/c_digo_do_celular_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';

class CDigoDoCelularScreen extends GetWidget<CDigoDoCelularController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String confirmationCode;
  final User _user = User();
  final _userService = UserService(userPool);

  Future _submit(BuildContext context) async {
    _formKey.currentState?.save();
    var accountConfirmed = false;
    String message;
    try {
      if (_user.email != null) {
        accountConfirmed =
            await _userService.confirmAccount(_user.email!, confirmationCode);
        message = 'Account successfully confirmed!';
      } else {
        message = 'Unknown client error occurred';
      }
    } on CognitoClientException catch (e) {
      if (e.code == 'InvalidParameterException' ||
          e.code == 'CodeMismatchException' ||
          e.code == 'NotAuthorizedException' ||
          e.code == 'UserNotFoundException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message ?? e.code ?? e.toString();
      } else {
        message = 'Unknown client error occurred';
      }
    } catch (e) {
      message = 'Unknown error occurred';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          if (accountConfirmed) {
            Navigator.pop(context);
          }
        },
      ),
      duration: Duration(seconds: 30),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future _resendConfirmation(BuildContext context) async {
    _formKey.currentState?.save();
    String message;
    try {
      if (_user.email != null) {
        await _userService.resendConfirmationCode(_user.email!);
        message = 'Confirmation code sent to ${_user.email!}!';
      } else {
        message = 'Unknown client error occurred';
      }
    } on CognitoClientException catch (e) {
      if (e.code == 'LimitExceededException' ||
          e.code == 'InvalidParameterException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message ?? e.code ?? e.toString();
      } else {
        message = 'Unknown client error occurred';
      }
    } catch (e) {
      message = 'Unknown error occurred';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
      duration: Duration(seconds: 30),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    String barcodeScanRes;
    try {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        final args2 = ModalRoute.of(context)!.settings.arguments as String;
        //bool registered = await couponRegister(context, args2);

        debugPrint("registered!");
        debugPrint(args2);
      }
    } on Exception {}

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
                      onTap: onTapMenu7)
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
                              padding: getPadding(left: 16, top: 26, right: 16),
                              child: Text("msg_informe_o_c_digo".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold18Gray801
                                      .copyWith(height: 1.22)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 17, right: 16),
                              child: Text("msg_informe_os_dados".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16Gray800
                                      .copyWith(height: 1.25)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 28, right: 16),
                              child: Text("lbl_c_digo".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium14
                                      .copyWith(height: 1.21)))),
                      CustomTextFormField(
                        width: 328,
                        focusNode: FocusNode(),
                        controller: controller.inputSearchController,
                        hintText: "lbl_digite_o_c_digo".tr,
                        margin: getMargin(left: 16, top: 2, right: 16),
                        textInputAction: TextInputAction.done,
                        alignment: Alignment.center,
                        validator: (value) {
                          if (value == null) {
                            return "Please enter valid code";
                          }

                          confirmationCode = value;
                          return null;
                        },
                      ),
                      CustomButton(
                          width: 328,
                          text: "lbl_reenviar_c_digo".tr,
                          margin: getMargin(
                              left: 16, top: 371, right: 16, bottom: 5),
                          onTap: () {
                            _submit(context);
                          },
                          alignment: Alignment.center),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(
                                      left: 15,
                                      top: 28,
                                      right: 15,
                                      bottom: 5),
                                  child:
                                  new GestureDetector(
                                      onTap: () {
                                        _resendConfirmation(context);
                                      },
                                      child: Text("msg_n_o_tem_uma_conta".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold14
                                              .copyWith(height: 1.21))
                                  ))
                          )
                    ])))));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.cadastrarSenhaOneScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapEnviarcdigo() {
    Get.toNamed(AppRoutes.cadastroConcluDoScreen);
  }

  onTapMenu7() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
