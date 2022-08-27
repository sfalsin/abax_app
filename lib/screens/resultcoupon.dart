import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner_example/models/user.dart';
import 'package:flutter_barcode_scanner_example/services/coupon_service.dart';
import 'package:flutter_barcode_scanner_example/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_json_viewer/flutter_json_viewer.dart';
import 'package:flutter_barcode_scanner_example/constants.dart';

import '../secrets.dart';

class ResultCouponPage extends StatefulWidget {
  final scanBarcode;
  ResultCouponPage(this.scanBarcode);

  @override
  _ResultCouponPageState createState() => new _ResultCouponPageState();
}

class _ResultCouponPageState extends State<ResultCouponPage> {
  final _userService = UserService(userPool);
  late CouponService _couponService;
  late AwsSigV4Client _awsSigV4Client;
  User? _user = User();
  bool _isAuthenticated = false;
  var _scanBarcode;
  late Future<bool> callData;
  @override
  void initState() {
    var initState = super.initState();
    callData = _getValues();
    // _getValues(context);
  }

  Future<bool> _getValues() async {
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
            _scanBarcode = await _couponService.getCoupon(widget.scanBarcode,accessToken);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                title: const Text('ABAX Leitura de Cupom'),
                backgroundColor: const Color(0xff764abc),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: const Color(0xff764abc),
                    systemNavigationBarColor: const Color(0xff764abc)),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                )),
            drawer: Drawer(),
            body: FutureBuilder<bool>(
                future: callData,
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (snapshot.hasData) {
                    children = <Widget>[
                      Container(child: JsonViewer(_scanBarcode)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.of(
                          //   context,
                          //   rootNavigator: true,
                          // ).pop<void>(
                          //   context,
                          // );
                          //Navigator.of(context).maybePop();//Navigator.pop<void>(context);
                        },
                        child: const Text('Voltar!'),
                      ),
                    ];
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
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
                }));
  }
}
