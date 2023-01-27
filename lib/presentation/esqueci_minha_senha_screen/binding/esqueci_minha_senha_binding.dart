import '../controller/esqueci_minha_senha_controller.dart';
import 'package:get/get.dart';

class EsqueciMinhaSenhaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EsqueciMinhaSenhaController());
  }
}
