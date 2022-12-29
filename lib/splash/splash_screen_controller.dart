import 'package:clype/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class SplashScreenController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (user != null) {
      Get.offAndToNamed(
        RoutesClass.getViewProfileRoute(),
        arguments: FirebaseAuth.instance.currentUser!.uid,
      );
    } else {
      Get.offAndToNamed(RoutesClass.getLoginRoute());
    }

    //intializeDynamicLink();
  }

  void intializeDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      final String uid = refLink.queryParameters['ref'].toString();
      //Share.share(uid, subject: 'Teesting the link');
      print(uid);
      Get.offAndToNamed(
        RoutesClass.getViewProfileRoute(),
        arguments: uid,
      );
    } else {
      if (user != null) {
        Get.offAndToNamed(
          RoutesClass.getViewProfileRoute(),
          arguments: FirebaseAuth.instance.currentUser!.uid,
        );
      } else {
        Get.offAndToNamed(RoutesClass.getLoginRoute());
      }
    }
  }
}
