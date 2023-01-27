import 'package:abax/core/app_export.dart';
import '/presentation/signup_screen/models/cadastrar_novo_usu_rio_model.dart';
import 'package:flutter/material.dart';

class CadastrarNovoUsuRioController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController inputSearchOneController = TextEditingController();

  TextEditingController inputSearchTwoController = TextEditingController();

  TextEditingController inputSearchThreeController = TextEditingController();

  TextEditingController inputSearchFourController = TextEditingController();

  Rx<CadastrarNovoUsuRioModel> cadastrarNovoUsuRioModelObj =
      CadastrarNovoUsuRioModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputSearchController.dispose();
    inputSearchOneController.dispose();
    inputSearchTwoController.dispose();
    inputSearchThreeController.dispose();
    inputSearchFourController.dispose();
  }
}
