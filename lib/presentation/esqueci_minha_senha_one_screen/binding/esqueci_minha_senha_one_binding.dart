import '../controller/esqueci_minha_senha_one_controller.dart';
import 'package:get/get.dart';

class EsqueciMinhaSenhaOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EsqueciMinhaSenhaOneController());
  }
}
