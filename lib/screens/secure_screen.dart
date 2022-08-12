import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_example/main.dart';
import 'package:flutter_barcode_scanner_example/screens/login_screen.dart';
import 'package:flutter_barcode_scanner_example/screens/resultcoupon.dart';
import 'package:flutter_barcode_scanner_example/screens/resultprod.dart';
import 'package:flutter_barcode_scanner_example/secrets.dart';
import 'package:flutter_barcode_scanner_example/models/user.dart';
import 'package:flutter_barcode_scanner_example/services/user_service.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:sized_icon_button/sized_icon_button.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class SecureScreen extends StatefulWidget {
  SecureScreen({Key? key}) : super(key: key);

  @override
  _SecureScreenState createState() => _SecureScreenState();
}

class _SecureScreenState extends State<SecureScreen> {
  late TooltipBehavior _tooltipBehavior;
  final _userService = UserService(userPool);
  //late CounterService _counterService;
  late AwsSigV4Client _awsSigV4Client;
  User? _user = User();
  //Counter _counter = Counter(0);
  bool _isAuthenticated = false;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }


  Future<UserService> _getValues(BuildContext context) async {
    try {
      await _userService.init();
      _isAuthenticated = await _userService.checkAuthenticated();
      if (_isAuthenticated) {
        // get user attributes from cognito
        _user = await _userService.getCurrentUser();

        // get session credentials
        final credentials = await _userService.getCredentials();
        if (credentials != null && credentials.accessKeyId != null && credentials.secretAccessKey != null) {
          _awsSigV4Client = AwsSigV4Client(
            credentials.accessKeyId!,
            credentials.secretAccessKey!,
            apiEndpoint,
            region: awsRegion,
            sessionToken: credentials.sessionToken,
          );

          // // get previous count
          // _counterService = CounterService(_awsSigV4Client);
          // try {
          //   _counter = await _counterService.getCounter();
          // } catch (e) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          // }
        }
      }
      return _userService;
    } on CognitoClientException catch (e) {
      if (e.code == 'NotAuthorizedException') {
        await _userService.signOut();
        Navigator.pop(context);
      }
      rethrow;
    }
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

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

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      //_scanBarcode = json.decode(barcodeScanRes);
      if (barcodeScanRes != null && barcodeScanRes != "") {
        Navigator.push<void>(
          context,
          // MaterialPageRoute<void>(builder: (context) => ResultPage(_scanBarcode)),
          MaterialPageRoute<void>(
              builder: (context) => ResultCouponPage(barcodeScanRes)),
        );
      }
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal(context) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
      // http.Response r = await http.get(Uri.parse('https://m6ksrg8yd8.execute-api.us-east-1.amazonaws.com/dev2/free/'+barcodeScanRes));
      // print(r.body);
      // barcodeScanRes = r.body; //jsonDecode(r.body);

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
      // _scanBarcode = json.decode(barcodeScanRes);
      if (barcodeScanRes != null && barcodeScanRes != "") {
        Navigator.push<void>(
          context,
          // MaterialPageRoute<void>(builder: (context) => ResultPage(_scanBarcode)),
          MaterialPageRoute<void>(
              builder: (context) => ResultProdPage(barcodeScanRes)),
        );
      }
      //_scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('ABAX'),backgroundColor: Colors.purple,systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.purple,systemNavigationBarColor: Colors.purple
            )),
            drawer: Drawer(),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            // Chart title
                            title: ChartTitle(text: 'Ultimas atividades'),
                            // Enable legend
                            legend: Legend(isVisible: false),
                            // Enable tooltip
                            tooltipBehavior: _tooltipBehavior,
                            series: <LineSeries<SalesData, String>>[
                              LineSeries<SalesData, String>(
                                  dataSource: <SalesData>[
                                    SalesData('Jan', 35),
                                    SalesData('Feb', 28),
                                    SalesData('Mar', 34),
                                    SalesData('Apr', 32),
                                    SalesData('May', 40)
                                  ],
                                  xValueMapper: (SalesData sales, _) =>
                                  sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                  sales.sales,
                                  // Enable data label
                                  dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                            ]),
                        SizedBox(height: 20),
                        SizedIconButton(
                          color: Colors.purple,
                          icon: Icon(
                            Icons.qr_code_2,
                            color: Colors.white,
                            size: 88,
                          ),
                          onPressed: () => scanQR(context),
                        ),
                        SizedBox(height: 20),
                        SizedIconButton(
                          color: Colors.purple,
                          icon: Icon(
                            CupertinoIcons.barcode,
                            color: Colors.white,
                            size: 88,
                          ),
                          onPressed: () => scanBarcodeNormal(context),
                        ),
                        SizedBox(height: 20),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) => ResultPage()),
                        //       );
                        //     },
                        //     child: Text('Tela')),
                        // ElevatedButton(
                        //     onPressed: () => scanQR(),
                        //     child: Text('Escanear cupom fiscal')),
                        // ElevatedButton(
                        //     onPressed: () => startBarcodeScanStream(),
                        //     child: Text('Start barcode scan stream')),
                        //JsonViewer(_scanBarcode),
                        // Text('Scan result : $_scanBarcode\n',
                        //     style: TextStyle(fontSize: 20))
                      ]));
            })));
  }
}