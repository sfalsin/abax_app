import '../controller/cadastro_conclu_do_controller.dart';
import 'package:get/get.dart';

class CadastroConcluDoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastroConcluDoController());
  }
}
