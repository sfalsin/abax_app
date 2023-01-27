import '../controller/cadastrar_senha_controller.dart';
import 'package:get/get.dart';

class CadastrarSenhaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastrarSenhaController());
  }
}
