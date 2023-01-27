import '../controller/perfil_meu_endere_o_four_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOFourController());
  }
}
