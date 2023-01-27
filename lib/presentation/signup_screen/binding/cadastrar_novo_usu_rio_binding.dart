import '../controller/cadastrar_novo_usu_rio_controller.dart';
import 'package:get/get.dart';

class CadastrarNovoUsuRioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastrarNovoUsuRioController());
  }
}
