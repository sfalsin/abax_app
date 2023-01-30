import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
//import 'package:flutter_charts/flutter_charts.dart';
//import 'package:charts_painter/chart.dart';


import '../../helper.dart';
import '../../models/user.dart';
import '../../secrets.dart';
import '../../services/coupon_service.dart';
import '../../services/product_service.dart';
import '../../services/user_service.dart';
import 'controller/android_large_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:abax/core/app_export.dart';
import 'package:abax/widgets/app_bar/appbar_image.dart';
import 'package:abax/widgets/app_bar/appbar_title.dart';
import 'package:abax/widgets/app_bar/custom_app_bar.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:vertical_barchart/vertical-legend.dart';


class AndroidLargeTwoScreen extends GetWidget<AndroidLargeTwoController> {
  final _userService = UserService(userPool);
  late CouponService _couponService;
  late ProductService _productService;
  late AwsSigV4Client _awsSigV4Client;
  //late List<ListItem> items;
  User? _user = User();
  bool _isAuthenticated = false;
  var _scanBarcode;
  late Future<bool> callData;
  var _myCoupons;
  late List<SalesData> items;
  Map<DateTime, double> data = {};
  List<VBarChartModel> bardata = [];

  Future<bool> couponRegister(context,scanBarcode) async {
    try {
      await _userService.init();
      _isAuthenticated = await _userService.checkAuthenticated();
      if (_isAuthenticated) {
        _user = await _userService.getCurrentUser();

        // get session credentials
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
          _couponService = CouponService(_awsSigV4Client);
          try {
            _scanBarcode = await _couponService.getCoupon(scanBarcode,accessToken);
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          }
        }
      }
      // String barcodeScanRes;
      // final credentials = await _userService.getCredentials();
      // _awsSigV4Client = new AwsSigV4Client(
      //     credentials!.accessKeyId!, credentials!.secretAccessKey!, ENDPOINT,
      //     region: AWS_REGION, sessionToken: credentials.sessionToken);
      // http.Response r = await http.get(Uri.parse(
      //     'https://m6ksrg8yd8.execute-api.us-east-1.amazonaws.com/dev2/freeqr/' +
      //         widget.scanBarcode.replaceAll(
      //             "http://app.sefaz.es.gov.br/ConsultaNFCe/qrcode.aspx?p=",
      //             "")));
      // print(r.body);
      // barcodeScanRes = r.body; //jsonDecode(r.body);
      // _scanBarcode = json.decode(barcodeScanRes);
      return true;
    } on Exception {
      //barcodeScanRes = 'Failed to get platform version.';
      return false;
    }
  }

  Future<bool> _getValues(context) async {
    String barcodeScanRes;
    try {
      final args = ModalRoute
          .of(context)!
          .settings
          .arguments;
      if (args != null) {
        final args2 =  ModalRoute
            .of(context)!
            .settings
            .arguments as String;
        bool registered = await couponRegister(context, args2);
        if (registered) {
          debugPrint("registered!");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(_scanBarcode["message"])));
          debugPrint(_scanBarcode["message"]);
        }
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
          _couponService = CouponService(_awsSigV4Client);
          _productService = ProductService(_awsSigV4Client);

          try {
            int qtd = 0;
            for (var item0 in await _productService.getMyProducts(accessToken)) {
              String nome = item0["name"];
              bardata.add(VBarChartModel(
                index: 5,
                label: nome.split(" ")[0],
                colors: [Colors.teal, Colors.indigo],
                jumlah: item0["total_expend"],
                //tooltip: item0["total_expend"].toString(),
                description: Text(
                  item0["total_expend"].toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ));
              qtd++;
              if (qtd>3) {
                break;
              }
            }
            for (var item in await _couponService.getMyCoupons(accessToken)) {
              data[DateTime.parse(item["data_emissao"])] =
                  item["valor_total"] / 1.0;
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

  @override
  Widget build(BuildContext context) {


    callData = _getValues(context);

    return SafeArea(
        child: Scaffold(
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
                      height: getSize(32.00),
                      width: getSize(32.00),
                      svgPath: ImageConstant.imgMenu,
                      margin: getMargin(all: 16),
                      onTap: onTapMenu10)
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
    if (snapshot.hasData) {

                return SingleChildScrollView(
                child: Padding(
                    padding: getPadding(bottom: 93),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: getVerticalSize(427.00),
                              width: size.width,
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding: getPadding(all: 36),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height:
                                                          getVerticalSize(1.00),
                                                      width: getHorizontalSize(
                                                          258.00),
                                                      margin:
                                                          getMargin(left: 23),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .gray200)),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              top: 11),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                    "lbl_20".tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterRegular966),
                                                                Container(
                                                                    height:
                                                                        getVerticalSize(
                                                                            1.00),
                                                                    width: getHorizontalSize(
                                                                        258.00),
                                                                    margin: getMargin(
                                                                        top: 9,
                                                                        bottom:
                                                                            2),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                ColorConstant.gray200))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 5,
                                                              top: 12,
                                                              right: 270),
                                                          child: Text(
                                                              "lbl_0".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtInterRegular966)))
                                                ]))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                      height: getVerticalSize(
                                                          140.00),
                                                      width: size.width,
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          children: [
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: CommonImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgRectangle2045,
                                                                    height: getVerticalSize(
                                                                        140.00),
                                                                    width: getHorizontalSize(
                                                                        360.00))),
                                                            Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    Container(
                                                                        margin: getMargin(
                                                                            top:
                                                                                1),
                                                                        decoration:
                                                                            AppDecoration
                                                                                .gradientWhiteA70000WhiteA700,
                                                                        child: Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                            children: [
                                                                              Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(left: 138, top: 99, right: 7, bottom: 5), child: Text("lbl_minhas_compras".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanMedium2878)))
                                                                            ])))
                                                          ]))),
                                              Container(
                                                  width: double.infinity,
                                                  margin: getMargin(
                                                      left: 7,
                                                      top: 10,
                                                      right: 7),
                                                  decoration: AppDecoration
                                                      .outlineBlack900192
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder6),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            29,
                                                                        top: 22,
                                                                        right:
                                                                            29),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  1,
                                                                              bottom:
                                                                                  2),
                                                                          child: Text(
                                                                              "msg_gastos_mensais_por".tr,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtRobotoRomanSemiBold1287)),
                                                                      Card(
                                                                          clipBehavior: Clip
                                                                              .antiAlias,
                                                                          elevation:
                                                                              0,
                                                                          margin: EdgeInsets.all(
                                                                              0),
                                                                          color: ColorConstant
                                                                              .gray401,
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder9),
                                                                          child: Container(
                                                                              height: getSize(19.00),
                                                                              width: getSize(19.00),
                                                                              decoration: AppDecoration.fillGray401.copyWith(borderRadius: BorderRadiusStyle.roundedBorder9),
                                                                              child: Stack(children: [
                                                                                Align(alignment: Alignment.center, child: Padding(padding: getPadding(left: 8, top: 3, right: 8, bottom: 3), child: CommonImageView(svgPath: ImageConstant.imgGroup5, height: getVerticalSize(12.00), width: getHorizontalSize(3.00))))
                                                                              ])))
                                                                    ]))),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 36,
                                                                top: 1,
                                                                right: 36),
                                                            child: Text(
                                                                "msg_gastos_do_m_s_de"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtRobotoRomanRegular1127)),
                                                        Container(
                                                            height:
                                                                getVerticalSize(
                                                                    1.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    346.00),
                                                            margin: getMargin(
                                                                top: 21),
                                                            decoration: BoxDecoration(
                                                                color: ColorConstant
                                                                    .gray200)),
                                                        chartToRun()
                                                      ]))
                                            ]))
                                  ])),
                          //chartToRun(),

                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: getVerticalSize(355.00),
                                  width: getHorizontalSize(358.00),
                                  margin: getMargin(top: 14, right: 2),
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                margin: getMargin(
                                                    left: 7,
                                                    right: 5,
                                                    bottom: 10),
                                                decoration: AppDecoration
                                                    .outlineBlack900192
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder6),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 27,
                                                                      top: 21,
                                                                      right:
                                                                          27),
                                                              child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            bottom:
                                                                                4),
                                                                        child: Text(
                                                                            "Gastos totais por produto",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtRobotoRomanSemiBold1287)),
                                                                    Card(
                                                                        clipBehavior:
                                                                            Clip
                                                                                .antiAlias,
                                                                        elevation:
                                                                            0,
                                                                        margin: getMargin(
                                                                            top:
                                                                                1),
                                                                        color: ColorConstant
                                                                            .gray401,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadiusStyle.roundedBorder9),
                                                                        child: Container(

                                                                            decoration: AppDecoration.fillGray401.copyWith(borderRadius: BorderRadiusStyle.roundedBorder9),
                                                                            child: Stack(children: [
                                                                              Align(alignment: Alignment.center, child: Padding(padding: getPadding(left: 8, top: 3, right: 8, bottom: 3), child: CommonImageView(svgPath: ImageConstant.imgGroup5, height: getVerticalSize(12.00), width: getHorizontalSize(3.00))))
                                                                            ])))
                                                                  ]))),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 36,
                                                                      top: 3,
                                                                      right:
                                                                          128),
                                                              child: Text(
                                                                  "msg_acompanhe_seus_gastos"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtRobotoRomanRegular1127))),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                              height:
                                                                  getVerticalSize(
                                                                      1.00),
                                                              width:
                                                                  getHorizontalSize(
                                                                      346.00),
                                                              margin: getMargin(
                                                                  top: 20),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: ColorConstant
                                                                          .gray200))),
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: _buildGrafik()
                                                      ),
                                                      Container(
                                                          height:
                                                              getVerticalSize(
                                                                  1.00),
                                                          width:
                                                              getHorizontalSize(
                                                                  258.00),
                                                          margin: getMargin(
                                                              left: 29,
                                                              top: 1,
                                                              right: 29),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .gray200))
                                                    ]))),

                                      ])))
                        ])));
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

  onTapColumnticket() {
    Get.toNamed(AppRoutes.perfilMeuEndereOFiveScreen);
  }

  onTapMenu10() {
    Get.toNamed(AppRoutes.menuScreen);
  }





  Widget chartToRun() {


     Map<DateTime, double> line1 = data;
     //Map<DateTime, double> line2 = createLine2_2();

     LineChart lineChart = LineChart.fromDateTimeMaps([data], [Colors.green ],['C'],
         tapTextFontWeight: FontWeight.w400);
     return                           Container(
         height: getVerticalSize(200.00),
         width: size.width-20,
         child:  AnimatedLineChart(
                  lineChart,
                  key: UniqueKey(),
                  gridColor: Colors.black54,
                  textStyle: TextStyle(fontSize: 10, color: Colors.black54),
                  toolTipColor: Colors.white,
                ));
   }

  Widget _buildGrafik() {
    /*List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: "Strawberry",
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 20,
        tooltip: "20 Pcs",
        description: Text(
          "Most selling fruit last week",
          style: TextStyle(fontSize: 10),
        ),
      ),
      VBarChartModel(
        index: 1,
        label: "Apple",
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 55,
        tooltip: "55 Pcs",
        description: Text(
          "Most selling fruit this week",
          style: TextStyle(fontSize: 10),
        ),
      ),
      VBarChartModel(
        index: 2,
        label: "Broccoli",
        colors: [Colors.teal, Colors.indigo],
        jumlah: 12,
        tooltip: "12 Pcs",
      ),
      VBarChartModel(
        index: 3,
        label: "Chilli",
        colors: [Colors.teal, Colors.indigo],
        jumlah: 1,
        tooltip: "5 Pcs",
      ),
      VBarChartModel(
        index: 4,
        label: "Manggo",
        colors: [Colors.orange, Colors.deepOrange],
        jumlah: 15,
        tooltip: "15 Pcs",
      ),
      VBarChartModel(
        index: 5,
        label: "Asparagus",
        colors: [Colors.teal, Colors.indigo],
        jumlah: 30,
        tooltip: "30 Pcs",
        description: Text(
          "Favorites vegetables",
          style: TextStyle(fontSize: 10),
        ),
      ),
    ];*/
    return VerticalBarchart(
      maxX: 1000,
      data: bardata,
      showLegend: true,
      showBackdrop: true,
      barStyle: BarStyle.DEFAULT,
      alwaysShowDescription: true,
      // legend: [
      //   Vlegend(
      //     isSquare: false,
      //     color: Colors.orange,
      //     text: "Fruits",
      //   ),
      //   Vlegend(
      //     isSquare: false,
      //     color: Colors.teal,
      //     text: "Vegetables",
      //   )
      // ],
    );
  }

}

