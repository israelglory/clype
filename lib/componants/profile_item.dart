import 'package:clype/exports.dart';
import 'package:clype/models/user_model.dart';

class ProfileItem extends StatelessWidget {
  final UserModel userModel;
  const ProfileItem({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        itemTile(
          icon: Icons.person,
          name: '${userModel.lastName} ${userModel.firstName}',
        ),
        const SizedBox(
          height: 16,
        ),
        itemTile(
          icon: Icons.phone,
          name: userModel.phoneNumber,
        ),
        const SizedBox(
          height: 16,
        ),
        itemTile(
          icon: Icons.email_rounded,
          name: userModel.email,
        ),
      ],
    );
  }
}

Widget itemTile({
  required IconData icon,
  required String name,
}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.only(
      left: 16.0,
      right: 16.0,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.blue,
          //Color.fromRGBO(225, 95, 27, .3),
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        const SizedBox(
          width: 16.0,
        ),
        AppText(
          name,
          size: 22,
          fontWeight: FontWeight.w600,
        )
      ],
    ),
  );
}
