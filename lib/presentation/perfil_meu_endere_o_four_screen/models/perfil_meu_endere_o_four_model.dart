import 'package:get/get.dart';
import 'listclock1_item_model.dart';
import 'listfour1_item_model.dart';

class PerfilMeuEndereOFourModel {
  RxList<Listclock1ItemModel> listclock1ItemList =
      RxList.filled(3, Listclock1ItemModel());

  RxList<Listfour1ItemModel> listfour1ItemList =
      RxList.filled(3, Listfour1ItemModel());
}
