import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner_example/models/user.dart';
import 'package:flutter_barcode_scanner_example/services/coupon_service.dart';
import 'package:flutter_barcode_scanner_example/services/product_service.dart';
import 'package:flutter_barcode_scanner_example/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_json_viewer/flutter_json_viewer.dart';

import '../secrets.dart';

class ResultProdPage extends StatefulWidget {
  final scanBarcode;
  ResultProdPage(this.scanBarcode);

  @override
  _ResultProdPageState createState() => new _ResultProdPageState();
}

class _ResultProdPageState extends State<ResultProdPage> {
  final _userService = UserService(userPool);
  late ProductService _productService;
  late AwsSigV4Client _awsSigV4Client;
  User? _user = User();
  bool _isAuthenticated = false;
  var _scanBarcode;
  late Future<bool> callData;
  @override
  void initState() {
    var initState = super.initState();
    callData = _getValues();
  }

  Future<bool> _getValues() async {
    String barcodeScanRes;
    try {
      await _userService.init();
      _isAuthenticated = await _userService.checkAuthenticated();
      if (_isAuthenticated) {
        _user = await _userService.getCurrentUser();

        final credentials = await _userService.getCredentials();
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
            _scanBarcode = await _productService.getProduct(widget.scanBarcode);
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: const Text('ABAX Leitura de código de barras'),
                backgroundColor: Colors.purple,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.purple,
                    systemNavigationBarColor: Colors.purple)),
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
                          Navigator.of(
                            context,
                            rootNavigator: true,
                          ).pop(
                            context,
                          );
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
                  return CircularProgressIndicator();
                })));
  }
}
