import '../controller/perfil_meu_endere_o_six_controller.dart';
import 'package:get/get.dart';

class PerfilMeuEndereOSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMeuEndereOSixController());
  }
}
