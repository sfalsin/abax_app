import '../controller/perfil_meu_endere_o_three_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOThreeController());
  }
}
