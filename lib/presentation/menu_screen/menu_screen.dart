import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';

import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/coupon_service.dart';
import '../../services/user_service.dart';
import 'controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';

class MenuScreen extends GetWidget<MenuController> {
  final _userService = UserService(userPool);
  late CouponService _couponService;
  late AwsSigV4Client _awsSigV4Client;
  User? _user = User();
  String userName = "";
  bool _isAuthenticated = false;
  late Future<bool> callData;

  Future<bool> _getValues(context) async {
    await _userService.init();
    _isAuthenticated = await _userService.checkAuthenticated();
    if (_isAuthenticated) {
      _user = await _userService.getCurrentUser();
      userName = _user!.email.toString();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    callData = _getValues(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray900,
            appBar: CustomAppBar(
                height: getVerticalSize(64.00),
                title: Container(
                    height: getVerticalSize(37.00),
                    width: getHorizontalSize(109.40),
                    margin: getMargin(left: 16),
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
                      height: getVerticalSize(22.00),
                      width: getHorizontalSize(23.00),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      svgPath: ImageConstant.imgClose,
                      margin:
                          getMargin(left: 16, top: 21, right: 16, bottom: 21))
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
                          child: Padding(
                              padding: getPadding(left: 16, top: 24, right: 16),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(44.00)),
                                  child: CommonImageView(
                                      imagePath: ImageConstant.imgImage2,
                                      height: getSize(88.00),
                                      width: getSize(88.00),
                                      fit: BoxFit.cover)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 16, top: 14, right: 16),
                              child: FutureBuilder<bool>(
                                  future: callData,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(userName,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtInterSemiBold20Gray101
                                              .copyWith(height: 1.25));
                                    } else {
                                      return Text(userName,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtInterSemiBold20Gray101
                                              .copyWith(height: 1.25));
                                    }
                                  })
                              // Text("msg_joana_dos_santos".tr,
                              //     overflow: TextOverflow.ellipsis,
                              //     textAlign: TextAlign.left,
                              //     style: AppStyle.txtInterSemiBold20Gray101
                              //         .copyWith(height: 1.25))

                              )),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getVerticalSize(1.00),
                              width: getHorizontalSize(328.00),
                              margin: getMargin(left: 16, top: 24, right: 16),
                              decoration: BoxDecoration(
                                  color: ColorConstant.gray1006c))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 25, top: 26, right: 25),
                              child: Text("lbl_meu_perfil".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16Gray301
                                      .copyWith(height: 1.25)))),
                      //(){ Navigator.of(context).pop(); }
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/cupons_lidos_screen');
                          },
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding:
                                      getPadding(left: 25, top: 44, right: 25),
                                  child: Text("lbl_minhas_compras".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterMedium16Gray301
                                          .copyWith(height: 1.25))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 25, top: 34, right: 25),
                              child: Text("lbl_meus_cupons".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16Gray301
                                      .copyWith(height: 1.25)))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 25, top: 29, right: 25),
                              child: Text("msg_ajuda_e_feedback".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterMedium16Gray301
                                      .copyWith(height: 1.25)))),
                      CustomButton(
                          width: 328,
                          text: "lbl_sair_do_app".tr,
                          margin: getMargin(
                              left: 16, top: 236, right: 16, bottom: 5),
                          onTap: onTapSairdoapp,
                          alignment: Alignment.center)
                    ])))));
  }

  onTapSairdoapp() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
