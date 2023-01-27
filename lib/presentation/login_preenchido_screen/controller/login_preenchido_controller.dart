import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/login_preenchido_screen/models/login_preenchido_model.dart';
import 'package:flutter/material.dart';

class LoginPreenchidoController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController groupFiveController = TextEditingController();

  Rx<LoginPreenchidoModel> loginPreenchidoModelObj = LoginPreenchidoModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    groupFiveController.dispose();
  }
}
