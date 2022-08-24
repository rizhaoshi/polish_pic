import 'package:get/get.dart';
import '../app/modules/main/main_binding.dart';
import '../app/modules/main/main_page.dart';
import '../app/modules/red_envelope/red_envelope_binding.dart';
import '../app/modules/red_envelope/red_envelope_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.MAIN, page: () => MainPage(), binding: MainBinding()),
    GetPage(name: Routes.RED_ENVELOPE, page: () => RedEnvelopePage(), binding: RedEnvelopeBinding()),
  ];
}

//命名路由名称
abstract class Routes {
  static const INITIAL = "/";

  //启动页
  static const SPLASH = "/splash";

  //主页
  static const MAIN = "/main";

  //首页
  static const HOME = "/home";

  //挑战目标页
  static const RED_ENVELOPE = "/red_envelope";
}
