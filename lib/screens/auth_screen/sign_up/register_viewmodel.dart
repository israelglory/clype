import 'package:clype/exports.dart';
import 'package:clype/routes/routes.dart';
import 'package:clype/services/user_service/user_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  final UserAuth userAuth = UserAuth();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool show = true;
  bool inProgress = false;
  String? uploadUrl;

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

  ///Signingup with fullname and email and password with all fields filled
  void signUp(BuildContext context) async {
    try {
      if (emailController.text.isEmpty ||
          firstNameController.text.isEmpty ||
          passController.text.isEmpty ||
          phoneNumberController.text.isEmpty) {
        Fluttertoast.showToast(
          msg: 'One field is empty, Please fill accordingly',
          backgroundColor: Colors.red,
        );
      } else {
        inProgress = true;
        update();

        ///Sending data to firebase
        await userAuth.registerWithEmailandPass(
          email: emailController.text,
          password: passController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: phoneNumberController.text,
        );

        ///Navigating to profile view
        Get.offAndToNamed(
          RoutesClass.getViewProfileRoute(),
          arguments: FirebaseAuth.instance.currentUser!.uid,
        );
        inProgress = false;
        update();
      }
    } on Exception catch (e) {
      inProgress = false;
      update();
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.red,
      );
    }
  }
}
