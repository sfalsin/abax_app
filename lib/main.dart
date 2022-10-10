import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_example/screens/home_screen.dart';
import 'package:flutter_barcode_scanner_example/screens/login_screen.dart';
import 'package:flutter_barcode_scanner_example/screens/resultcoupon.dart';
import 'package:flutter_barcode_scanner_example/screens/resultprod.dart';
import 'package:flutter_barcode_scanner_example/services/coupon_service.dart';
import 'package:flutter_json_viewer/flutter_json_viewer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:sized_icon_button/sized_icon_button.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _scanBarcode; // = 'Unknown';
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  //
  // Future<void> startBarcodeScanStream() async {
  //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
  //           '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
  //       .listen((barcode) => print(barcode));
  // }
  //
  // Future<void> scanQR(context) async {
  //   String barcodeScanRes;
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //   setState(() {
  //     if (barcodeScanRes != null && barcodeScanRes != "") {
  //       Navigator.push<void>(
  //         context,
  //         MaterialPageRoute<void>(
  //             builder: (context) => ResultCouponPage(barcodeScanRes)),
  //       );
  //     }
  //   });
  // }
  //
  // Future<void> scanBarcodeNormal(context) async {
  //   String barcodeScanRes;
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //
  //   setState(() {
  //     if (barcodeScanRes != null && barcodeScanRes != "") {
  //       Navigator.push<void>(
  //         context,
  //         MaterialPageRoute<void>(
  //             builder: (context) => ResultProdPage(barcodeScanRes)),
  //       );
  //     }
  //   });
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABAX',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }

}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
