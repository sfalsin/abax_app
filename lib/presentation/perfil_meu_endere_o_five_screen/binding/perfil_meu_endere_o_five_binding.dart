import '../controller/perfil_meu_endere_o_five_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOFiveController());
  }
}
