import '../controller/perfil_meu_endere_o_one_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOOneController());
  }
}
