import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:abax/models/user.dart';
import 'package:abax/secrets.dart';
import 'package:abax/services/user_service.dart';

import 'core/app_export.dart';


final _userService = UserService(userPool);
User _user = User();
bool _isAuthenticated = false;

Future<UserService> _getValues() async {
  await _userService.init();
  _isAuthenticated = await _userService.checkAuthenticated();
  return _userService;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _getValues();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.





  @override
  Widget build(BuildContext context)  {

    String routeStart = AppRoutes.initialRoute;
    if (_isAuthenticated) {
      routeStart = '/android_large_one_screen';
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('pt', 'BR'),
      title: 'ABAX',
      initialBinding: InitialBindings(),
      initialRoute: routeStart,
      getPages: AppRoutes.pages,
    );
  }
}
