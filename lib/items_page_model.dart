import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ItemsPageModel with ChangeNotifier {
  bool login_flg = true;


  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    print(FirebaseAuth.instance.currentUser?.email); //Google登録したemail
    print(FirebaseAuth.instance.currentUser?.displayName); //Google登録した表示名
    print(FirebaseAuth.instance.currentUser?.photoURL); //Google登録した画像URL

    // Once signed in, return the UserCredential
    this.login_flg = true;
    notifyListeners();
  }
}

