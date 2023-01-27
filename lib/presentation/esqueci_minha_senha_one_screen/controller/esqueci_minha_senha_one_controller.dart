import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/esqueci_minha_senha_one_screen/models/esqueci_minha_senha_one_model.dart';
import 'package:flutter/material.dart';

class EsqueciMinhaSenhaOneController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  Rx<EsqueciMinhaSenhaOneModel> esqueciMinhaSenhaOneModelObj =
      EsqueciMinhaSenhaOneModel().obs;

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
