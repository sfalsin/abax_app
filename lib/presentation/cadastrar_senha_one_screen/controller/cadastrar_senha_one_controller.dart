import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/cadastrar_senha_one_screen/models/cadastrar_senha_one_model.dart';
import 'package:flutter/material.dart';

class CadastrarSenhaOneController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController inputSearchOneController = TextEditingController();

  Rx<CadastrarSenhaOneModel> cadastrarSenhaOneModelObj =
      CadastrarSenhaOneModel().obs;

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
