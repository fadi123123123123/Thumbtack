import 'package:get/get.dart';

import 'package:project1/controllers/sign%20up%20controller.dart';

import '../controllers/password settings controller.dart';
import '../controllers/sign in controller.dart';
import '../controllers/user controller.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(PasswordSettingsController());
  }

}