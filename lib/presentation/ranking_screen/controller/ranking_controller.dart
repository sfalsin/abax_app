import '../../../core/app_export.dart';

import '../models/ranking_model.dart';

class RankingController extends GetxController {
  Rx<RankingModel> rankingModelObj =
      RankingModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
