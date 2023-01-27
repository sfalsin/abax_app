import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController inputSearchOneController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputSearchController.dispose();
    inputSearchOneController.dispose();
  }
}
