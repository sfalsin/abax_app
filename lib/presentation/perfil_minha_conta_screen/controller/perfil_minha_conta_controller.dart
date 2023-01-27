import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/perfil_minha_conta_screen/models/perfil_minha_conta_model.dart';
import 'package:flutter/material.dart';

class PerfilMinhaContaController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController emailOneController = TextEditingController();

  TextEditingController inputSearchOneController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController inputSearchTwoController = TextEditingController();

  TextEditingController inputSearchThreeController = TextEditingController();

  Rx<PerfilMinhaContaModel> perfilMinhaContaModelObj =
      PerfilMinhaContaModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputSearchController.dispose();
    emailController.dispose();
    emailOneController.dispose();
    inputSearchOneController.dispose();
    dateController.dispose();
    inputSearchTwoController.dispose();
    inputSearchThreeController.dispose();
  }
}
