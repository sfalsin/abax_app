import 'dart:async';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:abax/models/user.dart';
import 'package:abax/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


//import '../constants.dart';
import '../secrets.dart';

class UserService {
  late final CognitoUserPool _userPool;
  CognitoUser? _cognitoUser;
  CognitoUserSession? _session;
  UserService(this._userPool);
  CognitoCredentials? credentials;

  /// Initiate user session from local storage if present
  Future<bool> init() async {
    final prefs = await SharedPreferences.getInstance();
    final storage = Storage(prefs);


    // final storage = CognitoMemoryStorage();
    _userPool.storage = storage;


    _cognitoUser = await _userPool.getCurrentUser();
    if (_cognitoUser == null) {
      return false;
    }
    _session = await _cognitoUser!.getSession();
    return _session?.isValid() ?? false;
  }

  /// Get existing user from session with his/her attributes
  Future<User?> getCurrentUser() async {
    if (_cognitoUser == null || _session == null) {
      return null;
    }
    if (!_session!.isValid()) {
      return null;
    }
    final attributes = await _cognitoUser?.getUserAttributes();
    if (attributes == null) {
      return null;
    }
    final user = User.fromUserAttributes(attributes);
    user.hasAccess = true;
    return user;
  }

  /// Retrieve user credentials -- for use with other AWS services
  Future<CognitoCredentials?> getCredentials() async {
    if (_cognitoUser == null || _session == null) {
      return null;
    }

    credentials = CognitoCredentials(cognitoIdentityPoolId, userPool);
    await credentials!.getAwsCredentials(_session?.getIdToken().getJwtToken());
    print("teste");
    return credentials!;
  }

  /// Retrieve user credentials -- for use with other AWS services
  Future<CognitoUserSession?> getUserSession() async {
    if (_cognitoUser == null || _session == null) {
      return null;
    }

    // credentials = CognitoCredentials(cognitoIdentityPoolId, userPool);
    // await credentials!.getAwsCredentials(_session?.getIdToken().getJwtToken());
    // print("teste");
    return _session!;
  }


  /// Login user
  Future<User?> login(String email, String password) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);

    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );

    bool isConfirmed;
    try {
      _session = await _cognitoUser?.authenticateUser(authDetails);
      isConfirmed = true;
    } on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        isConfirmed = false;
      } else {
        rethrow;
      }
    }

    if (_session == null || !_session!.isValid()) {
      return null;
    }

    final attributes = await _cognitoUser?.getUserAttributes();
    if (attributes != null) {
      final user = User.fromUserAttributes(attributes);
      user.confirmed = isConfirmed;
      user.hasAccess = true;
      return user;
    } else {
      return null;
    }
  }

  /// Confirm user's account with confirmation code sent to email
  Future<bool> confirmAccount(String email, String confirmationCode) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);

    return await _cognitoUser?.confirmRegistration(confirmationCode) ?? false;
  }

  /// Resend confirmation code to user's email
  Future<void> resendConfirmationCode(String email) async {
    _cognitoUser = CognitoUser(email, _userPool, storage: _userPool.storage);
    await _cognitoUser?.resendConfirmationCode();
  }

  /// Check if user's current session is valid
  Future<bool> checkAuthenticated() async {
    if (_cognitoUser == null || _session == null) {
      return false;
    }
    return _session!.isValid();
  }

  /// Sign up user
  Future<User> signUp(String email, String password, String name) async {
    CognitoUserPoolData data;
    final userAttributes = [
      AttributeArg(name: 'name', value: name),
      //AttributeArg(name: 'email_verified', value:	'true'),
      AttributeArg(name: 'email', value:	email)
    ];
    data = await _userPool.signUp(email, password, userAttributes: userAttributes);

    final user = User();
    user.email = email;
    user.name = name;
    user.confirmed = data.userConfirmed ?? false;

    return user;
  }

  Future<void> signOut() async {
    if (credentials != null) {
      await credentials!.resetAwsCredentials();
    }
    if (_cognitoUser != null) {
      return _cognitoUser!.signOut();
    }
  }
}