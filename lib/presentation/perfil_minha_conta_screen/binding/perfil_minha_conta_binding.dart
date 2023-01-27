import '../controller/perfil_minha_conta_controller.dart';
import 'package:get/get.dart';

class PerfilMinhaContaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PerfilMinhaContaController());
  }
}
