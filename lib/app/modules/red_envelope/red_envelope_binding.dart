import 'package:get/get.dart';
import 'package:polish_pic/app/modules/red_envelope/red_envelope_controller.dart';

class RedEnvelopeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RedEnvelopeController>(
      () => RedEnvelopeController(),
    );
  }
}
