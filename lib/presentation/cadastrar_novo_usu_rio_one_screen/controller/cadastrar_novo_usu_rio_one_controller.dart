import 'package:abax/core/app_export.dart';
import 'package:abax/presentation/cadastrar_novo_usu_rio_one_screen/models/cadastrar_novo_usu_rio_one_model.dart';
import 'package:flutter/material.dart';

class CadastrarNovoUsuRioOneController extends GetxController {
  TextEditingController inputSearchController = TextEditingController();

  TextEditingController inputSearchThreeController = TextEditingController();

  TextEditingController inputSearchFourController = TextEditingController();

  TextEditingController inputSearchFiveController = TextEditingController();

  TextEditingController inputSearchSixController = TextEditingController();

  Rx<CadastrarNovoUsuRioOneModel> cadastrarNovoUsuRioOneModelObj =
      CadastrarNovoUsuRioOneModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputSearchController.dispose();
    inputSearchThreeController.dispose();
    inputSearchFourController.dispose();
    inputSearchFiveController.dispose();
    inputSearchSixController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    cadastrarNovoUsuRioOneModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    cadastrarNovoUsuRioOneModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    cadastrarNovoUsuRioOneModelObj.value.dropdownItemList1.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    cadastrarNovoUsuRioOneModelObj.value.dropdownItemList1.refresh();
  }
}
