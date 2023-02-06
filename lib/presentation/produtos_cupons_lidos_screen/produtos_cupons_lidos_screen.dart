import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';

import '../../helper.dart';
import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/coupon_service.dart';
import '../../services/product_service.dart';
import '../../services/user_service.dart';
import 'controller/cupons_lidos_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';



class ProdutosCuponsLidosScreen extends GetWidget<ProdutosCuponsLidosController> {
  var pwdWidgets = <Widget>[];
  late Future<bool> callData;
  final _userService = UserService(userPool);
  late ProductService _productService;
  late AwsSigV4Client _awsSigV4Client;
  User? _user = User();
  bool _isAuthenticated = false;

  Future<bool> _getValues(context) async {
    String args2 = "";
    try {
      final args = ModalRoute
          .of(context)!
          .settings
          .arguments;
      if (args != null) {
        args2 =  ModalRoute
            .of(context)!
            .settings
            .arguments as String;
        // bool registered = await couponRegister(context, args2);
        // if (registered) {
        //   debugPrint("registered!");
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text(_scanBarcode["message"])));
        //   debugPrint(_scanBarcode["message"]);
        // }
      }

    } on Exception {

    }
    try {
      await _userService.init();
      _isAuthenticated = await _userService.checkAuthenticated();
      if (_isAuthenticated) {
        _user = await _userService.getCurrentUser();

        final credentials = await _userService.getCredentials();
        final accessToken = await _userService.getUserSession();

        if (credentials != null &&
            credentials.accessKeyId != null &&
            credentials.secretAccessKey != null) {
          _awsSigV4Client = AwsSigV4Client(
            credentials.accessKeyId!,
            credentials.secretAccessKey!,
            apiEndpoint,
            region: awsRegion,
            sessionToken: credentials.sessionToken,
          );

          // get previous count
          _productService = ProductService(_awsSigV4Client);

          try {
            pwdWidgets.add(makeTitle());
            for (var item in await _productService.getMyProductsCoupon(args2,accessToken)) {
              print(item);
              pwdWidgets.add(makeCoupon(
                  truncateString(30,item["name"]),
                  item["valor_emitente"].toString() +
                      "   " +
                      item["qtd_emitente"].toString()));
            }
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          }
        }
      }
      return true;
    } on Exception {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Erro desconhecido!")));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    callData = _getValues(context);
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
            body: FutureBuilder<bool>(
                future: callData,
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    return Container(
                        width: size.width,
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: getPadding(
                                    left: 11, top: 24, right: 11, bottom: 390),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: pwdWidgets,
                                ))));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    heightFactor: 10,
                    widthFactor: 10,
                    child: SizedBox(
                      height: 64,
                      width: 64,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                      ),
                    ),
                  );
                })));
  }

  Widget makeTitle() {
    return Padding(
        padding: getPadding(left: 5, right: 10, bottom: 20),
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
                          borderRadius: BorderRadiusStyle.circleBorder18),
                      child: Container(
                          height: getSize(36.00),
                          width: getSize(36.00),
                          decoration: AppDecoration.outlineBlack90019.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder18),
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
                                            svgPath: ImageConstant.imgArrowleft,
                                            height: getSize(20.00),
                                            width: getSize(20.00)))))
                          ])))),
              Padding(
                  padding: getPadding(left: 90, top: 7, bottom: 3),
                  child: Text("Produtos",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold20Gray802
                          .copyWith(height: 1.25)))
            ]));
  }

  Widget makeCoupon(String title, String msg) {
    return new GestureDetector(
        onTap: () {
          onTapRowprice();
        },
        child: Container(
            margin: getMargin(top: 12),
            decoration: AppDecoration.fillLightgreen50.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder9,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Padding(
                      padding: getPadding(top: 13, bottom: 18),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: getPadding(left: 0, right: 0),
                                child: Text(title,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRobotoRomanBold16)),
                            Container(
                                width: getHorizontalSize(232.00),
                                margin: getMargin(top: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                          width: getHorizontalSize(200.00),
                                          margin: getMargin(top: 1),
                                          child: Text(msg,
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .txtRobotoRomanRegular14)),

                                    ]))
                          ]))
                ])));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapRowprice() {
    //Get.toNamed(AppRoutes.ProdutosCuponsLidosSixScreen);
  }

  onTapRowpricetwo() {
    //Get.toNamed(AppRoutes.ProdutosCuponsLidosThreeScreen);
  }

  onTapMenu18() {
    Get.toNamed(AppRoutes.menuScreen);
  }
}
