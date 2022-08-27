import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner_example/screens/confirmation_screen.dart';
import 'package:flutter_barcode_scanner_example/secrets.dart';
import 'package:flutter_barcode_scanner_example/models/user.dart';
import 'package:flutter_barcode_scanner_example/services/user_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User _user = User();
  final userService = UserService(userPool);

  void submit(BuildContext context) async {
    _formKey.currentState?.save();

    String message;
    var signUpSuccess = false;
    if (_user.email != null && _user.password != null && _user.name != null) {
      try {
        _user = await userService.signUp(_user.email!, _user.password!, _user.name!);
        signUpSuccess = true;
        message = 'User sign up successful!';
      } on CognitoClientException catch (e) {
        if (e.code == 'UsernameExistsException' ||
            e.code == 'InvalidParameterException' ||
            e.code == 'InvalidPasswordException' ||
            e.code == 'ResourceNotFoundException') {
          message = e.message ?? e.code ?? e.toString();
        } else {
          message = 'Unknown client error occurred';
        }
      } catch (e) {
        message = 'Unknown error occurred';
      }
    } else {
      message = 'Missing required attributes on user';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          if (signUpSuccess) {
            Navigator.pop(context);
            if (!_user.confirmed) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmationScreen(email: _user.email!)),
              );
            }
          }
        },
      ),
      duration: Duration(seconds: 30),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('ABAX - Cadastro'),backgroundColor: const Color(0xff764abc),systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: const Color(0xff764abc),systemNavigationBarColor: const Color(0xff764abc)
      )),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.account_box),
                    title: TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onSaved: (n) => _user.name = n,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: TextFormField(
                      decoration: InputDecoration(hintText: 'example@inspire.my', labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (n) => _user.email = n,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password!',
                      ),
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
                      style: ElevatedButton.styleFrom(primary: const Color(0xff764abc)),
                      onPressed: () {
                        submit(context);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}