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

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR(context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      if (barcodeScanRes != null && barcodeScanRes != "") {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (context) => ResultCouponPage(barcodeScanRes)),
        );
      }
    });
  }

  Future<void> scanBarcodeNormal(context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    setState(() {
      if (barcodeScanRes != null && barcodeScanRes != "") {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
              builder: (context) => ResultProdPage(barcodeScanRes)),
        );
      }
    });
  }

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

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: Scaffold(
  //           appBar: AppBar(
  //               title: const Text('ABAX'),
  //               backgroundColor: Colors.purple,
  //               systemOverlayStyle: SystemUiOverlayStyle(
  //                   statusBarColor: Colors.purple,
  //                   systemNavigationBarColor: Colors.purple)),
  //           drawer: Drawer(),
  //           body: Builder(builder: (BuildContext context) {
  //             return Container(
  //                 alignment: Alignment.center,
  //                 child: Flex(
  //                     direction: Axis.vertical,
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: <Widget>[
  //                       SfCartesianChart(
  //                           primaryXAxis: CategoryAxis(),
  //                           // Chart title
  //                           title: ChartTitle(text: 'Ultimas atividades'),
  //                           // Enable legend
  //                           legend: Legend(isVisible: false),
  //                           // Enable tooltip
  //                           tooltipBehavior: _tooltipBehavior,
  //                           series: <LineSeries<SalesData, String>>[
  //                             LineSeries<SalesData, String>(
  //                                 dataSource: <SalesData>[
  //                                   SalesData('Jan', 35),
  //                                   SalesData('Feb', 28),
  //                                   SalesData('Mar', 34),
  //                                   SalesData('Apr', 32),
  //                                   SalesData('May', 40)
  //                                 ],
  //                                 xValueMapper: (SalesData sales, _) =>
  //                                     sales.year,
  //                                 yValueMapper: (SalesData sales, _) =>
  //                                     sales.sales,
  //                                 // Enable data label
  //                                 dataLabelSettings:
  //                                     DataLabelSettings(isVisible: true))
  //                           ]),
  //                       SizedBox(height: 20),
  //                       SizedIconButton(
  //                         color: Colors.purple,
  //                         icon: Icon(
  //                           Icons.qr_code_2,
  //                           color: Colors.white,
  //                           size: 88,
  //                         ),
  //                         onPressed: () => scanQR(context),
  //                       ),
  //                       SizedBox(height: 20),
  //                       SizedIconButton(
  //                         color: Colors.purple,
  //                         icon: Icon(
  //                           CupertinoIcons.barcode,
  //                           color: Colors.white,
  //                           size: 88,
  //                         ),
  //                         onPressed: () => scanBarcodeNormal(context),
  //                       ),
  //                       SizedBox(height: 20),
  //                       // ElevatedButton(
  //                       //     onPressed: () {
  //                       //       Navigator.push(
  //                       //         context,
  //                       //         MaterialPageRoute(builder: (context) => ResultPage()),
  //                       //       );
  //                       //     },
  //                       //     child: Text('Tela')),
  //                       // ElevatedButton(
  //                       //     onPressed: () => scanQR(),
  //                       //     child: Text('Escanear cupom fiscal')),
  //                       // ElevatedButton(
  //                       //     onPressed: () => startBarcodeScanStream(),
  //                       //     child: Text('Start barcode scan stream')),
  //                       //JsonViewer(_scanBarcode),
  //                       // Text('Scan result : $_scanBarcode\n',
  //                       //     style: TextStyle(fontSize: 20))
  //                     ]));
  //           })));
  // }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
