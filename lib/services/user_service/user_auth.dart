import 'package:clype/exports.dart';
import 'package:clype/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuth {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  ///Registering with Email is done here in this function. Passing the required parameter will sign user up in the application.
  Future<void> registerWithEmailandPass({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'uid': _firebaseAuth.currentUser!.uid,
    });
  }

  /// User can login with Email and password by providing the email and pass word that have already been created.
  Future<UserCredential?> loginWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserModel> userData() async {
    final userinfo = await getUserData();

    final user = UserModel(
      email: userinfo['email'],
      firstName: userinfo['firstName'],
      lastName: userinfo['lastName'],
      phoneNumber: userinfo['phoneNumber'],
      uid: _firebaseAuth.currentUser!.uid,
    );
    return user;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// We can get user data through this function
  Future getUserData() async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    final userData = docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data();
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return userData;
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Fluttertoast.showToast(
              msg: 'account-exists-with-different-credential');
        } else if (e.code == 'invalid-credential') {
          Fluttertoast.showToast(msg: 'Invalid Credential');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
    return user;
  }
}
