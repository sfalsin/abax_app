import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<void> scanQR(context) async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    print(barcodeScanRes);
    //await _couponService.getCoupon(barcodeScanRes);

    // http.Response r = await http.get(Uri.parse('https://m6ksrg8yd8.execute-api.us-east-1.amazonaws.com/dev2/freeqr/'+barcodeScanRes.replaceAll("http://app.sefaz.es.gov.br/ConsultaNFCe/qrcode.aspx?p=","")));
    // print(r.body);
    // barcodeScanRes = r.body; //jsonDecode(r.body);

  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }

  // setState(() {
  print(barcodeScanRes);
  if (barcodeScanRes != null &&
      barcodeScanRes != "" &&
      barcodeScanRes != "-1") {
    await Navigator.pushNamed(context, '/android_large_two_screen',arguments:barcodeScanRes);
  }
  // });
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
