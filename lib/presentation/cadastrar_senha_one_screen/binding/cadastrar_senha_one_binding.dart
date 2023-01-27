import '../controller/cadastrar_senha_one_controller.dart';
import 'package:get/get.dart';

class CadastrarSenhaOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastrarSenhaOneController());
  }
}
