import 'package:abax/core/app_export.dart';
import '/presentation/confirmation_screen/models/c_digo_do_celular_model.dart';
import 'package:flutter/material.dart';

class CDigoDoCelularController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  Rx<CDigoDoCelularModel> cDigoDoCelularModelObj = CDigoDoCelularModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputSearchController.dispose();
  }
}
