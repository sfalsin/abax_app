import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_example/screens/confirmation_screen.dart';
import 'package:flutter_barcode_scanner_example/screens/secure_screen.dart';
import 'package:flutter_barcode_scanner_example/screens/signup_screen.dart';
//import 'package:flutter_barcode_scanner_example/screens/secure_screen.dart';
import 'package:flutter_barcode_scanner_example/secrets.dart';
import 'package:flutter_barcode_scanner_example/models/user.dart';
import 'package:flutter_barcode_scanner_example/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.email}) : super(key: key);

  final String? email;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userService = UserService(userPool);
  User _user = User();
  bool _isAuthenticated = false;

  Future<UserService> _getValues() async {
    await _userService.init();
    _isAuthenticated = await _userService.checkAuthenticated();
    return _userService;
  }

  void submit(BuildContext context) async {
    _formKey.currentState?.save();
    String message;
    if (_user.email != null && _user.password != null) {
      try {
        var u = await _userService.login(_user.email!, _user.password!);
        if (u == null) {
          message = 'Could not login user';
        } else {
          _user = u;
          message = 'User sucessfully logged in!';
          if (!_user.confirmed) {
            message = 'Please confirm user account';
          }
        }
      } on CognitoClientException catch (e) {
        if (e.code == 'InvalidParameterException' ||
            e.code == 'NotAuthorizedException' ||
            e.code == 'UserNotFoundException' ||
            e.code == 'ResourceNotFoundException') {
          message = e.message ?? e.code ?? e.toString();
        } else {
          message = 'An unknown client error occured';
        }
      } catch (e) {
        message = 'An unknown error occurred';
      }
    } else {
      message = 'Missing required attributes on user';
    }
    if (_user.hasAccess) {
      Navigator.pop(context);
      if (!_user.confirmed) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConfirmationScreen(email: _user.email ?? 'no email found')),
        );
      } else {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecureScreen()),
        );
        //await Navigator.push(context, MaterialPageRoute(builder: (context) => SecureCounterScreen()));
      }
    } else {
      final snackBar = SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () async {
          },
        ),
        duration: Duration(seconds: 30),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // final snackBar = SnackBar(
    //   content: Text(message),
    //   action: SnackBarAction(
    //     label: 'OK',
    //     onPressed: () async {
    //       if (_user.hasAccess) {
    //         Navigator.pop(context);
    //         if (!_user.confirmed) {
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => ConfirmationScreen(email: _user.email ?? 'no email found')),
    //           );
    //         } else {
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(builder: (context) => SecureScreen()),
    //           );
    //           //await Navigator.push(context, MaterialPageRoute(builder: (context) => SecureCounterScreen()));
    //         }
    //       }
    //     },
    //   ),
    //   duration: Duration(seconds: 30),
    // );
    //
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getValues(),
        builder: (context, AsyncSnapshot<UserService> snapshot) {
          if (snapshot.hasData) {
            if (_isAuthenticated) {
              return SecureScreen();
            }
            final screenSize = MediaQuery.of(context).size;
            return Scaffold(
              appBar: AppBar(title: const Text('ABAX Login'),backgroundColor: Colors.purple,systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.purple,systemNavigationBarColor: Colors.purple
              )),
              body: Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: TextFormField(
                              initialValue: widget.email,
                              decoration: InputDecoration(hintText: 'username', labelText: 'Username'),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (n) => _user.email = n,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.lock),
                            title: TextFormField(
                              decoration: InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              onSaved: (n) => _user.password = n,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            width: screenSize.width,
                            margin: EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: ElevatedButton(
                              onPressed: () => submit(context),
                              style: ElevatedButton.styleFrom(primary: Colors.purple),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                            width: screenSize.width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.purple),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Scaffold(appBar: AppBar(title: Text('Loading...')));
        });
  }
}