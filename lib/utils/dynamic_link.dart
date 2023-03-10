import 'package:clype/routes/routes.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DynamiclinkProvider {
  Future<String> createLink(String uid) async {
    final String url = 'https://com.example.clype?ref=$uid';

    final DynamicLinkParameters paramenter = DynamicLinkParameters(
      androidParameters: const AndroidParameters(
        packageName: 'com.example.clype',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.clype',
        minimumVersion: '0',
      ),
      link: Uri.parse(url),
      uriPrefix: 'https://clype.page.link',
    );

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;

    final refLink = await link.buildShortLink(paramenter);

    return refLink.shortUrl.toString();
  }

  ///Initialize Dynamic linking
  void intializeDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      final String uid = refLink.queryParameters['ref'].toString();
      Get.offAndToNamed(
        RoutesClass.getViewProfileRoute(),
        arguments: uid,
      );
    }
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final Uri refLink = event.link;
      final String uid = refLink.queryParameters['ref'].toString();
      //Share.share(uid, subject: 'Teesting the link');
      //print(uid);
      Get.offAndToNamed(
        RoutesClass.getViewProfileRoute(),
        arguments: uid,
      );
    });
  }
}
