import 'package:clype/exports.dart';
import 'package:clype/routes/routes.dart';
import 'package:clype/screens/profile/view_profile_view.dart';
import 'package:clype/services/user_service/user_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final UserAuth userAuth = UserAuth();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool inProgress = false;
  bool show = true;
  //final String currentUser = FirebaseAuth.instance.currentUser!.uid;

  ///This is to hide the password
  void onObscure() {
    show = false;
    update();
  }

  ///We use this function to show password
  onhide() {
    show = true;
    update();
  }

  void login(BuildContext context) async {
    try {
      if (emailController.text.isEmpty) {
        Fluttertoast.showToast(
            msg: 'Email Cannot be empty', backgroundColor: Colors.red);
      } else if (passController.text.isEmpty) {
        Fluttertoast.showToast(
            msg: 'Password Cannot be empty', backgroundColor: Colors.red);
      } else {
        inProgress = true;
        update();
        await userAuth.loginWithEmailAndPass(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        Get.offAndToNamed(
          RoutesClass.getViewProfileRoute(),
          arguments: FirebaseAuth.instance.currentUser!.uid,
        );
        inProgress = false;
        update();
      }
    } on FirebaseAuthException catch (e) {
      inProgress = false;
      update();
      Fluttertoast.showToast(
        msg: e.message!,
        backgroundColor: Colors.red,
      );
    }
  }
}
