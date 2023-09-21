import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ungquizth/models/user_model.dart';
import 'package:ungquizth/states/register.dart';

class AppService {
  Future<void> processSignInWithGmail() async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await FirebaseAuth.instance
        .signInWithCredential(oAuthCredential)
        .then((value) async {
      String uid = value.user!.uid;

      String urlImage = value.user!.photoURL!;
      String name = value.user!.displayName!;

      print('SignIn Success uid ----> $uid');

      FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .get()
          .then((value) {
        print('value -----> ${value.data()}');

        if (value.data() == null) {
          //Non Register
          Get.offAll(Register(
            urlImage: urlImage,
            name: name,
            uid: uid,
          ));
        } else {
          //Registered

          UserModel model = UserModel.fromMap(value.data()!);

          AppService().checkLogin(userModel: model);
        }
      });
    });
  }

  Future<void> processRegister({
    required Map<String, dynamic> map,
    required String uid,
  }) async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .set(map)
        .then((value) {
      print('Insert User Success');

      UserModel userModel = UserModel.fromMap(map);

      checkLogin(userModel: userModel);
    });
  }

  void checkLogin({required UserModel userModel}) {
    print('userModel ---> ${userModel.toMap()}');

    Get.offAllNamed('/${userModel.typeUser}');
  }
}
