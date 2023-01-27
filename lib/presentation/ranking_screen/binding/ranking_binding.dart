import '../controller/ranking_controller.dart';
import 'package:get/get.dart';

class RankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RankingController());
  }
}
