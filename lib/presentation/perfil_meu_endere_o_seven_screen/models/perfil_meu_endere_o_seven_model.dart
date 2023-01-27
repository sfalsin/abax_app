import 'package:get/get.dart';
import 'listclock3_item_model.dart';
import 'listfour3_item_model.dart';

class PerfilMeuEndereOSevenModel {
  RxList<Listclock3ItemModel> listclock3ItemList =
      RxList.filled(3, Listclock3ItemModel());

  RxList<Listfour3ItemModel> listfour3ItemList =
      RxList.filled(3, Listfour3ItemModel());
}
