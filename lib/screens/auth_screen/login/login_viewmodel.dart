import 'package:clype/exports.dart';
import 'package:clype/routes/routes.dart';
import 'package:clype/services/user_service/user_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;
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
          msg: 'Email Cannot be empty',
          backgroundColor: Colors.red,
        );
      } else if (passController.text.isEmpty) {
        Fluttertoast.showToast(
          msg: 'Password Cannot be empty',
          backgroundColor: Colors.red,
        );
      } else {
        inProgress = true;
        update();

        ///Authenticating the user
        await userAuth.loginWithEmailAndPass(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );

        ///Navigating to profile
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

  ///Signing up with google
  Future<void> signInWithGoogle() async {
    await userAuth.signInWithGoogle().then(
      (value) async {
        ///Sending userdata to firestore
        await _firestore
            .collection('users')
            .doc(_firebaseAuth.currentUser!.uid)
            .set(
          {
            'firstName': value!.displayName.toString().split(' ').first,
            'lastName': value.displayName.toString().split(' ').last,
            'phoneNumber': value.phoneNumber ?? 'No phone number',
            'email': value.email,
            'uid': _firebaseAuth.currentUser!.uid,
          },
        );
        Get.offAndToNamed(
          RoutesClass.getViewProfileRoute(),
          arguments: FirebaseAuth.instance.currentUser!.uid,
        );
      },
    );
  }
}
