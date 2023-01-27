import 'package:get/get.dart';
import 'listclock2_item_model.dart';
import 'listfour2_item_model.dart';

class PerfilMeuEndereOOneModel {
  RxList<Listclock2ItemModel> listclock2ItemList =
      RxList.filled(3, Listclock2ItemModel());

  RxList<Listfour2ItemModel> listfour2ItemList =
      RxList.filled(3, Listfour2ItemModel());
}
