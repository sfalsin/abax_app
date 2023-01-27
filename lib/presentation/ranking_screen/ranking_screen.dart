import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';

import '../../helper.dart';
import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/ranking_service.dart';
import '../../services/user_service.dart';
import 'controller/ranking_controller.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import 'models/listclock1_item_model.dart';
import 'models/listfour1_item_model.dart';
import 'widgets/listclock1_item_widget.dart';
import 'widgets/listfour1_item_widget.dart';

class RankingScreen
    extends GetWidget<RankingController> {
  final _userService = UserService(userPool);
  late RankingService _rankingService;
  late AwsSigV4Client _awsSigV4Client;
  //late List<ListItem> items;
  User? _user = User();
  bool _isAuthenticated = false;
  var _scanBarcode;
  late Future<bool> callData;
  var pwdWidgets = <Widget>[];
  Map<String, double> data = {};



  Future<bool> _getValues(context) async {
    String barcodeScanRes;

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
          _rankingService = RankingService(_awsSigV4Client);

          try {
            pwdWidgets.add(makeTitle());
            var count = 1;
            for (var item in await _rankingService.getMyRankings(accessToken)) {
              print(item);
              var nome =item["name"];
              var pontos = item["free_points"];
              pwdWidgets.add(makeRankingItem2(count.toString(),
                  nome,
                  pontos.toString()));
              count++;
            }


          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          }
        }
      }
      return true;
    } on Exception {
      barcodeScanRes = 'Failed to get platform version.';
      return false;
    }
  }

  Widget build(BuildContext context) {
    callData = _getValues(context);
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
                      onTap: onTapMenu15)
                ],
                styleType: Style.bgFillLime900),
            bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () { Navigator.pushNamed(context, '/ranking_screen');},
                      child:Container(
                          margin: getMargin(top: 10),
                          //decoration: AppDecoration.outlineBlack9003f,
                          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(padding: getPadding(left: 50, top: 17, right: 50), child: CommonImageView(svgPath: ImageConstant.imgTicket, height: getVerticalSize(23.00), width: getHorizontalSize(21.00)))),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(padding: getPadding(left: 31, top: 5, right: 31, bottom: 13), child: Text("lbl_ranking".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12Lime900)))
                          ]))),
                  Padding(padding: getPadding(left: 4, top: 9, right: 4)),
                  GestureDetector(
                    onTap: () {scanQR(context);},
                    child: Container(

                      margin: getMargin(left: 0, bottom: 1),
                      decoration: AppDecoration.outlineBlack9003f1.copyWith(borderRadius: BorderRadiusStyle.circleBorder38),
                      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                        Padding(padding: getPadding(left: 12, top: 9, right: 12), child: CommonImageView(svgPath: ImageConstant.imgQrcode, height: getSize(30.00), width: getSize(30.00))),
                        Padding(padding: getPadding(left: 12, top: 5, right: 12, bottom: 11), child: Text("lbl_cadastrar_nf".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12WhiteA700))
                      ]),
                    ),
                  )
                  ,
                  Padding(padding: getPadding(left: 4, top: 9, right: 4)),
                  GestureDetector(
                      onTap: () {Navigator.pushNamed(context, '/android_large_two_screen');},
                      child:Container(
                          margin: getMargin(top: 10),
                          //decoration: AppDecoration.outlineBlack9003f,
                          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(padding: getPadding(left: 50, top: 17, right: 50), child: CommonImageView(svgPath: ImageConstant.imgVector, height: getVerticalSize(23.00), width: getHorizontalSize(21.00)))),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(padding: getPadding(left: 31, top: 5, right: 31, bottom: 13), child: Text("lbl_gest_o_fin".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12Lime900)))
                          ]))),


                ]),
            body: FutureBuilder<bool>(
                future: callData,
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                child: Padding(
                    padding: getPadding(top: 24),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: pwdWidgets)));} else if (snapshot.hasError) {
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
  );})));
  }

  onTapReturn() {
    Get.toNamed(AppRoutes.perfilScreen);
  }

  onTapImgArrowleft() {
    Get.back();
  }

  onTapIrparameuscupons() {
    Get.toNamed(AppRoutes.perfilMeuEndereOOneScreen);
  }

  onTapMenu15() {
    Get.toNamed(AppRoutes.menuScreen);
  }

  Widget makeRankingItem(nome, pontos) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          margin: getMargin(
            top: 5.0,
            bottom: 5.0,
          ),
          decoration: AppDecoration.outlineBlack9003f2.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder9,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: getPadding(
                  left: 18,
                  top: 12,
                  bottom: 12,
                ),
                child: CommonImageView(
                  svgPath: ImageConstant.imgClock,
                  height: getVerticalSize(
                    50.00,
                  ),
                  width: getHorizontalSize(
                    44.00,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 10,
                  top: 6,
                  right: 0,
                  bottom: 9,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      30.50,
                    ),
                  ),
                  child: CommonImageView(
                    imagePath: ImageConstant.imgEllipse20,
                    height: getSize(
                      61.00,
                    ),
                    width: getSize(
                      61.00,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 11,
                  top: 15,
                  bottom: 9,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      nome,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold14Black900.copyWith(
                        height: 1.21,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 9,
                        right: 10,
                      ),
                      child: Text(
                        pontos,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterSemiBold20Black900.copyWith(
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  }

  Widget makeRankingItem2(posicao, nome, pontos){
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: getMargin(
          top: 5.0,
          bottom: 5.0,
        ),
        decoration: AppDecoration.outlineBlack9003f2.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder9,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: getPadding(
                left: 10,
                top: 8,
                right: 0,
                bottom: 12,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    22.00,
                  ),
                ),
                child: CommonImageView(
                  imagePath: ImageConstant.imgEllipse17,
                  height: getSize(
                    44.00,
                  ),
                  width: getSize(
                    44.00,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 23,
                top: 11,
                bottom: 10,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 8,
                      bottom: 9,
                    ),
                    child: Text(
                      posicao+"º",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterSemiBold20Black900.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 1,
                            ),
                            child: Text(
                              nome,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style:
                              AppStyle.txtInterSemiBold14Black900.copyWith(
                                height: 1.21,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 8,
                            right: 10,
                          ),
                          child: Text(
                            pontos,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterSemiBold14Black900.copyWith(
                              height: 1.21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget makeTitle(){
    return Padding(
        padding: getPadding(left: 16, right: 16, bottom: 13),
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
                      left: 89, top: 7, bottom: 13),
                  child: Text("lbl_ranking".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle
                          .txtInterSemiBold20Gray802
                          .copyWith(height: 1.25)))
            ]));
  }
}
