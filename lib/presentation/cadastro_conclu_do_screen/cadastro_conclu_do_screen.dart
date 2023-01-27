import 'controller/cadastro_conclu_do_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:abax/widgets/custom_button.dart';

class CadastroConcluDoScreen extends GetWidget<CadastroConcluDoController> {
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
                      onTap: onTapMenu8)
                ],
                styleType: Style.bgFillLime900),
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: getMargin(left: 16, top: 64, right: 16),
                          color: ColorConstant.green400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.circleBorder38),
                          child: Container(
                              height: getSize(76.00),
                              width: getSize(76.00),
                              decoration: AppDecoration.fillGreen400.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder38),
                              child: Stack(children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: getPadding(
                                            left: 17,
                                            top: 16,
                                            right: 16,
                                            bottom: 17),
                                        child: CommonImageView(
                                            svgPath: ImageConstant.imgIcon,
                                            height: getSize(42.00),
                                            width: getSize(42.00))))
                              ]))),
                      Padding(
                          padding: getPadding(left: 16, top: 22, right: 16),
                          child: Text("msg_cadastro_criado".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterSemiBold20
                                  .copyWith(height: 1.25))),
                      CustomButton(
                          width: 328,
                          text: "lbl_entrar_no_app".tr,
                          margin: getMargin(
                              left: 16, top: 440, right: 16, bottom: 5))
                    ])))));
  }

  onTapMenu8() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
