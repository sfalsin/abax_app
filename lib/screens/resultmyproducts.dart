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

class ResultMyProductsPage extends StatefulWidget {
  ResultMyProductsPage();

  @override
  _ResultMyProductsPageState createState() => new _ResultMyProductsPageState();
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final dynamic sender;

  MessageItem(this.sender);

  @override
  Widget buildTitle(BuildContext context) {
    try{
        return Text(sender["name"].substring(0,33));
    } catch (e){
      return Text(sender["name"]);
    }
  }
  //=>
  //    Text(sender["name"].substring(0,33));

  @override
  Widget buildSubtitle(BuildContext context) =>
      Text("Acumulado:"+sender["total_expend"].toString() +
          " | Medio:" +
          sender["average_price"].toString() +
          " | Máx:" +
          sender["max_price"].toString() +
          " | Min:" +
          sender["min_price"].toString());
}

class _ResultMyProductsPageState extends State<ResultMyProductsPage> {
  final _userService = UserService(userPool);
  late ProductService _Productservice;
  late AwsSigV4Client _awsSigV4Client;
  late List<ListItem> items;
  User? _user = User();
  bool _isAuthenticated = false;
  var _myProducts;
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
          _Productservice = ProductService(_awsSigV4Client);

          try {
            _myProducts = await _Productservice.getMyProducts(accessToken);
            var pricesSize = _myProducts.length;
            //pricesSize = pricesSize + 1;
            items = List<ListItem>.generate(
                pricesSize, (i) => MessageItem(_myProducts[i]));
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
    return Scaffold(
        appBar: AppBar(
            title: const Text('ABAX Produtos mais comprados'),
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
                return ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: items.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return ListTile(
                      title: item.buildTitle(context),
                      subtitle: item.buildSubtitle(context),
                    );
                  },
                );
                // children = <Widget>[
                //   //Container(child: JsonViewer(_scanBarcode)),
                //   Container(child: ListView.builder(
                //     // Let the ListView know how many items it needs to build.
                //     itemCount: items.length,
                //     // Provide a builder function. This is where the magic happens.
                //     // Convert each item into a widget based on the type of item it is.
                //     itemBuilder: (context, index) {
                //       final item = items[index];
                //
                //       return ListTile(
                //         title: item.buildTitle(context),
                //         subtitle: item.buildSubtitle(context),
                //       );
                //     },
                //   )),
                //   ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //       // Navigator.of(
                //       //   context,
                //       //   rootNavigator: true,
                //       // ).pop(
                //       //   context,
                //       // );
                //       //Navigator.of(context).maybePop();//Navigator.pop<void>(context);
                //     },
                //     child: const Text('Voltar!'),
                //   ),
                // ];
                // return Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: children,
                //   ),
                // );
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
            }));
  }
}
