import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/cadastrar_senha_screen/models/cadastrar_senha_model.dart';
import 'package:flutter/material.dart';

class CadastrarSenhaController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController inputSearchOneController = TextEditingController();

  Rx<CadastrarSenhaModel> cadastrarSenhaModelObj = CadastrarSenhaModel().obs;

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
