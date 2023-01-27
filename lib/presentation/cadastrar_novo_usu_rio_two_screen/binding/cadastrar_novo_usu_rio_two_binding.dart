import '../controller/cadastrar_novo_usu_rio_two_controller.dart';
import 'package:get/get.dart';

class CadastrarNovoUsuRioTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastrarNovoUsuRioTwoController());
  }
}
