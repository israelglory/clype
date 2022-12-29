import 'package:clype/componants/profile_item.dart';
import 'package:clype/constants/app_colors.dart';
import 'package:clype/exports.dart';
import 'package:clype/models/user_model.dart';
import 'package:clype/screens/profile/view_profile_viewmodel.dart';
import 'package:clype/utils/dynamic_link.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ViewProvileView extends StatelessWidget {
  const ViewProvileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewProfileViewModel>(
      init: ViewProfileViewModel(),
      builder: (model) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const AppText('Clype'),
            actions: [
              IconButton(
                onPressed: () {
                  DynamiclinkProvider().createLink(model.uid).then((value) {
                    Share.share(value);
                  });
                },
                icon: const Icon(
                  Icons.share,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              IconButton(
                onPressed: () {
                  model.logOut(context);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(
                'Profile',
                size: 22,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(model.uid)
                    .get()
                    .asStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    UserModel user = UserModel.fromFirestore(snapshot.data!);
                    return ProfileItem(
                      userModel: user,
                    );
                  } else {
                    return const Center(
                      child: Text("No users"),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
