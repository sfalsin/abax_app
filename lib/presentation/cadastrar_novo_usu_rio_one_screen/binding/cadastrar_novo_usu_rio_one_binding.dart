import '../controller/cadastrar_novo_usu_rio_one_controller.dart';
import 'package:get/get.dart';

class CadastrarNovoUsuRioOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastrarNovoUsuRioOneController());
  }
}
