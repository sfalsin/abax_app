import '../controller/perfil_meu_endere_o_two_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOTwoController());
  }
}
