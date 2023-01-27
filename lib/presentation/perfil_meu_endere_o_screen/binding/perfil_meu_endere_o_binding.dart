import '../controller/perfil_meu_endere_o_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOController());
  }
}
