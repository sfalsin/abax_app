import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/perfil_meu_endere_o_two_screen/models/perfil_meu_endere_o_two_model.dart';
import 'package:flutter/material.dart';

class PerfilMeuEndereOTwoController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController inputSearchOneController = TextEditingController();

  TextEditingController inputSearchTwoController = TextEditingController();

  TextEditingController inputSearchThreeController = TextEditingController();

  TextEditingController inputSearchFourController = TextEditingController();

  TextEditingController inputSearchFiveController = TextEditingController();

  TextEditingController apartamentoCounterController = TextEditingController();

  Rx<PerfilMeuEndereOTwoModel> perfilMeuEndereOTwoModelObj =
      PerfilMeuEndereOTwoModel().obs;

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
    inputSearchFiveController.dispose();
    apartamentoCounterController.dispose();
  }
}
