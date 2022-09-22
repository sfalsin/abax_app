import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_example/main.dart';
import 'package:flutter_barcode_scanner_example/screens/login_screen.dart';
import 'package:flutter_barcode_scanner_example/screens/resultcoupon.dart';
import 'package:flutter_barcode_scanner_example/screens/resultmycoupons.dart';
import 'package:flutter_barcode_scanner_example/screens/resultmyproducts.dart';
import 'package:flutter_barcode_scanner_example/screens/resultprod.dart';
import 'package:flutter_barcode_scanner_example/secrets.dart';
import 'package:flutter_barcode_scanner_example/models/user.dart';
import 'package:flutter_barcode_scanner_example/services/coupon_service.dart';
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
  late CouponService _couponService;
  late List<SalesData> items;
  var _myCoupons;
  //late CounterService _counterService;
  late AwsSigV4Client _awsSigV4Client;
  User? _user = User();
  String? userName;
  String? userMail;
  //Counter _counter = Counter(0);
  late Future<bool> callData;
  bool _isAuthenticated = false;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    callData = _getValues(context);
    super.initState();
  }

  Future<bool> _getValues(BuildContext context) async {
    try {
      await _userService.init();
      _isAuthenticated = await _userService.checkAuthenticated();
      if (_isAuthenticated) {
        // get user attributes from cognito
        _user = await _userService.getCurrentUser();
        userName = _user?.name;
        userMail = _user?.email;
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

          _couponService = CouponService(_awsSigV4Client);

          try {
            _myCoupons = await _couponService.getMyCoupons(accessToken);
            var pricesSize = _myCoupons.length;

            //pricesSize = pricesSize + 1;
            items = List<SalesData>.generate(
                pricesSize,
                (i) => SalesData(_myCoupons[i]["data_emissao"],
                    _myCoupons[i]["valor_total"]/1.0));
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          }

          // // get previous count
          // _counterService = CounterService(_awsSigV4Client);
          // try {
          //   _counter = await _counterService.getCounter();
          // } catch (e) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
          // }
        }
      }
      return true;
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
      print(barcodeScanRes);
      if (barcodeScanRes != null &&
          barcodeScanRes != "" &&
          barcodeScanRes != "-1") {
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
      if (barcodeScanRes != null &&
          barcodeScanRes != "" &&
          barcodeScanRes != "-1") {
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

  Future<void> myCoupons(context) async {
    setState(() {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(builder: (context) => ResultMyCouponsPage()),
      );
    });
  }

  Future<void> myProducts(context) async {
    setState(() {
      Navigator.push<void>(
        context,
        MaterialPageRoute<void>(builder: (context) => ResultMyProductsPage()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: const Text('ABAX'),
                backgroundColor: const Color(0xff764abc),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: const Color(0xff764abc),
                    systemNavigationBarColor: const Color(0xff764abc))),
            drawer: Drawer(
                child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  // <-- SEE HERE
                  decoration: BoxDecoration(color: const Color(0xff764abc)),
                  accountName: Text(
                    "ABAX Clube de compradores inteligentes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: const Text(
                    "suporte@abax.club",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  currentAccountPicture: Image(
                      image:
                          AssetImage('assets/icons/icon.png')), //FlutterLogo(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: const Text('Registrar Cupom Fiscal'),
                  onTap: () => scanQR(context),
                ),
                ListTile(
                  leading: Icon(
                    Icons.train,
                  ),
                  title: const Text('Consultar produto'),
                  onTap: () => scanBarcodeNormal(context),
                ),
                ListTile(
                  leading: Icon(
                    Icons.train,
                  ),
                  title: const Text('Todos cupoms importados'),
                  onTap: () => myCoupons(context),
                ),
                ListTile(
                  leading: Icon(
                    Icons.train,
                  ),
                  title: const Text('Produtos mais comprados'),
                  onTap: () => myCoupons(context),
                ),
              ],
            )),
            body: FutureBuilder<bool>(
                future: callData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
                                        dataSource: items,
                                        // dataSource: <SalesData>[
                                        //   SalesData('Jan', 35),
                                        //   SalesData('Feb', 28),
                                        //   SalesData('Mar', 34),
                                        //   SalesData('Apr', 32),
                                        //   SalesData('May', 40)
                                        //],
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
                                color: const Color(0xff764abc),
                                icon: Icon(
                                  Icons.qr_code_2,
                                  color: Colors.white,
                                  size: 88,
                                ),
                                onPressed: () => scanQR(context),
                              ),
                              SizedBox(height: 20),
                              SizedIconButton(
                                color: const Color(0xff764abc),
                                icon: Icon(
                                  CupertinoIcons.barcode,
                                  color: Colors.white,
                                  size: 88,
                                ),
                                onPressed: () => scanBarcodeNormal(context),
                              ),
                              SizedBox(height: 20),
                            ]));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(
                    heightFactor: 1,
                    widthFactor: 1,
                    child: SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                      ),
                    ),
                  );
                })));
  }
}
