import 'package:clype/exports.dart';
import 'package:clype/routes/routes.dart';
import 'package:clype/screens/auth_screen/login/login_view.dart';
import 'package:clype/services/user_service/user_auth.dart';
import 'package:get/get.dart';

class ViewProfileViewModel extends GetxController {
  final UserAuth userAuth = UserAuth();
  final uid = Get.arguments as String;
  final ScrollController listScrollController = ScrollController();
  void logOut(BuildContext context) async {
    await userAuth.logOut();
    Get.offAndToNamed(RoutesClass.getLoginRoute());
  }
}
