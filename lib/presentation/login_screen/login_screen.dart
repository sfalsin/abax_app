import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/user_service.dart';
import '../perfil_minha_conta_screen/perfil_minha_conta_screen.dart';
import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/core/utils/validation_functions.dart';
import 'package:abax/widgets/custom_button.dart';
import 'package:abax/widgets/custom_icon_button.dart';
import 'package:abax/widgets/custom_text_form_field.dart';
import 'package:abax/domain/googleauth/google_auth_helper.dart';
import 'package:abax/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final _userService = UserService(userPool);
  User _user = User();
  bool _isAuthenticated = false;



  void submit(BuildContext context) async {
    _formKey.currentState?.save();
    String message;
    if (_user.email != null && _user.password != null) {
      try {
        var u = await _userService.login(_user.email!, _user.password!);
        if (u == null) {
          message = 'Could not login user';
        } else {
          _user = u;
          message = 'User sucessfully logged in!';
          if (!_user.confirmed) {
            message = 'Please confirm user account';
          }
        }
      } on CognitoClientException catch (e) {
        if (e.code == 'InvalidParameterException' ||
            e.code == 'NotAuthorizedException' ||
            e.code == 'UserNotFoundException' ||
            e.code == 'ResourceNotFoundException') {
          message = e.message ?? e.code ?? e.toString();
        } else {
          message = 'An unknown client error occured';
        }
      } catch (e) {
        message = 'An unknown error occurred';
      }
    } else {
      message = 'Missing required attributes on user';
    }
    if (_user.hasAccess) {
      Navigator.pop(context);
      if (!_user.confirmed) {
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ConfirmationScreen(email: _user.email ?? 'no email found')),
        // );
      } else {
        await Navigator.pushNamed(context, '/android_large_one_screen');
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PerfilMinhaContaScreen()),
        // );
        //await Navigator.push(context, MaterialPageRoute(builder: (context) => SecureCounterScreen()));
      }
    } else {
      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () async {
          },
        ),
        duration: Duration(seconds: 30),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // final snackBar = SnackBar(
    //   content: Text(message),
    //   action: SnackBarAction(
    //     label: 'OK',
    //     onPressed: () async {
    //       if (_user.hasAccess) {
    //         Navigator.pop(context);
    //         if (!_user.confirmed) {
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => ConfirmationScreen(email: _user.email ?? 'no email found')),
    //           );
    //         } else {
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => SecureScreen()),
    //           );
    //           //await Navigator.push(context, MaterialPageRoute(builder: (context) => SecureCounterScreen()));
    //         }
    //       }
    //     },
    //   ),
    //   duration: Duration(seconds: 30),
    // );
    //
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                                                        right: 37, bottom: 2),
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
                                                        top: 2, right: 20),
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
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  controller: controller.inputSearchController,
                                  hintText: "msg_digite_o_seu_email".tr,
                                  margin:
                                      getMargin(left: 15, top: 3, right: 15),
                                  alignment: Alignment.center,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please enter valid email";
                                    }
                                    _user.email = value;
                                    return null;
                                  }),
                              Padding(
                                  padding:
                                      getPadding(left: 16, top: 24, right: 16),
                                  child: Text("lbl_senha".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium14
                                          .copyWith(height: 1.21))),
                              CustomTextFormField(
                                  width: 328,
                                  focusNode: FocusNode(),
                                  isObscureText: true,
                                  controller:
                                      controller.inputSearchOneController,
                                  hintText: "lbl_digite_a_senha".tr,
                                  margin:
                                      getMargin(left: 15, top: 3, right: 15),
                                  textInputAction: TextInputAction.done,
                                  validator: (value){
                                    if (value == null) {
                                      return "Please enter valid email";
                                    }

                                    _user.password = value;
                                    return null;
                                    },
                                  alignment: Alignment.center),
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
                                  onTap: () => submit(context),
                                  width: 328,
                                  text: "lbl_entrar".tr,
                                  margin:
                                      getMargin(left: 15, top: 26, right: 15),
                                  alignment: Alignment.center),
                              // Align(
                              //     alignment: Alignment.center,
                              //     child: Container(
                              //         height: getVerticalSize(30.00),
                              //         width: getHorizontalSize(328.00),
                              //         margin: getMargin(
                              //             left: 15, top: 24, right: 15),
                              //         child: Stack(
                              //             alignment: Alignment.center,
                              //             children: [
                              //               Align(
                              //                   alignment: Alignment.centerLeft,
                              //                   child: Container(
                              //                       height:
                              //                           getVerticalSize(1.00),
                              //                       width: getHorizontalSize(
                              //                           328.00),
                              //                       margin: getMargin(
                              //                           top: 14, bottom: 14),
                              //                       decoration: BoxDecoration(
                              //                           color: ColorConstant
                              //                               .gray400))),
                              //               CustomButton(
                              //                   width: 128,
                              //                   text:
                              //                       "msg_ou_conecte_se_com".tr,
                              //                   margin: getMargin(
                              //                       left: 40, right: 40),
                              //                   variant:
                              //                       ButtonVariant.FillGray101,
                              //                   shape: ButtonShape.Square,
                              //                   padding:
                              //                       ButtonPadding.PaddingAll7,
                              //                   fontStyle: ButtonFontStyle
                              //                       .InterRegular12,
                              //                   alignment: Alignment.center)
                              //             ]))),
                              // Align(
                              //     alignment: Alignment.center,
                              //     child: Padding(
                              //         padding: getPadding(
                              //             left: 15, top: 16, right: 15),
                              //         child: Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             mainAxisSize: MainAxisSize.min,
                              //             children: [
                              //               CustomIconButton(
                              //                   height: 50,
                              //                   width: 50,
                              //                   onTap: () {
                              //                     onTapBtntf();
                              //                   },
                              //                   child: CommonImageView(
                              //                       svgPath: ImageConstant
                              //                           .imgGoogle)),
                              //               CustomIconButton(
                              //                   height: 50,
                              //                   width: 50,
                              //                   margin: getMargin(left: 40),
                              //                   onTap: () {
                              //                     onTapBtntf1();
                              //                   },
                              //                   child: CommonImageView(
                              //                       svgPath: ImageConstant
                              //                           .imgFacebook))
                              //             ]))),
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
                                            Navigator.pushNamed(context, "/cadastrar_novo_usu_rio_screen");
                                          },
                                          child: Text("msg_n_o_tem_uma_conta".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtInterSemiBold14
                                              .copyWith(height: 1.21))
                                  ))
                              )
                            ]))))));
  }

  // onTapBtntf() async {
  //   await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
  //     if (googleUser != null) {
  //       //TODO Actions to be performed after signin
  //     } else {
  //       Get.snackbar('Error', 'user data is empty');
  //     }
  //   }).catchError((onError) {
  //     Get.snackbar('Error', onError.toString());
  //   });
  // }
  //
  // onTapBtntf1() async {
  //   await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
  //     //TODO Actions to be performed after signin
  //   }).catchError((onError) {
  //     Get.snackbar('Error', onError.toString());
  //   });
  // }
}
