import 'package:amazon_cognito_identity_dart_2/src/cognito_user_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import '../models/coupon.dart';


class CouponService {
  AwsSigV4Client awsSigV4Client;
  CouponService(this.awsSigV4Client) ;

  Future<dynamic> getCoupon(String key, [CognitoUserSession? accessToken]) async {
    final SigV4Request signedRequest = new SigV4Request(awsSigV4Client, method: 'GET', path: '/precoupon/'+key.replaceAll("http://app.sefaz.es.gov.br/ConsultaNFCe/qrcode.aspx","").replaceAll("?",""));
    final url = signedRequest.url;

    Map<String, String>? headers;
    if (signedRequest.headers != null) {
      headers = Map.from(signedRequest.headers!);
    }
    var a = accessToken?.getAccessToken().getJwtToken();
    headers!["Authorization"] = "Bearer "+a!;
    // var headers = {"Authorization": "Bearer "+this.token,
    //   "Content-Type": "application/json"};
    //print(headers);
    final response = await http.get(Uri.parse(url!), headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);

      //return body;//response.body;//responseJson.map((m) => new TreinoKeyValue.fromJson(m)).toList();
    } else {
      // If that call was not successful, throw an error.
      Map erro = {'erro':response.statusCode.toString()};
      return json.decode(json.encode(erro));
      throw Exception('Failed to load post:'+response.statusCode.toString());
    }
  }

  Future<dynamic> getMyCoupons([CognitoUserSession? accessToken]) async {
    final SigV4Request signedRequest = new SigV4Request(awsSigV4Client, method: 'GET', path: '/mycoupons');
    final url = signedRequest.url;

    Map<String, String>? headers;
    if (signedRequest.headers != null) {
      headers = Map.from(signedRequest.headers!);
    }
    var a = accessToken?.getAccessToken().getJwtToken();
    headers!["Authorization"] = "Bearer "+a!;
    final response = await http.get(Uri.parse(url!), headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      Map erro = {'erro':response.statusCode.toString()};
      return json.decode(json.encode(erro));
    }

  }


}