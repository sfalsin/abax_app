import '../controller/perfil_meu_endere_o_seven_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOSevenController());
  }
}
