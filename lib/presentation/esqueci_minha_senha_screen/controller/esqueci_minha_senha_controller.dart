import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/esqueci_minha_senha_screen/models/esqueci_minha_senha_model.dart';
import 'package:flutter/material.dart';

class EsqueciMinhaSenhaController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  Rx<EsqueciMinhaSenhaModel> esqueciMinhaSenhaModelObj =
      EsqueciMinhaSenhaModel().obs;

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
