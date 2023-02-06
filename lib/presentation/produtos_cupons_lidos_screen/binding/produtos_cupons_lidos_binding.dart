import '../controller/cupons_lidos_controller.dart';
import 'package:get/get.dart';

class ProdutosCuponsLidosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProdutosCuponsLidosController());
  }
}
