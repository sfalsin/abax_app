import 'package:get/get.dart';
import 'listclock_item_model.dart';
import 'listfour_item_model.dart';

class PerfilMeuEndereOFiveModel {
  RxList<ListclockItemModel> listclockItemList =
      RxList.filled(3, ListclockItemModel());

  RxList<ListfourItemModel> listfourItemList =
      RxList.filled(3, ListfourItemModel());
}
