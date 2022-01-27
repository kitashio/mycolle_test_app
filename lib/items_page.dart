import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mycolle_test_app/firestore_test.dart';
import 'package:mycolle_test_app/items_page_model.dart';
import 'package:provider/provider.dart';
import 'items.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (BuildContext context) => ItemsModel(),
    child: Scaffold(
      appBar: AppBar(
        title: const Text('コレクション'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                child: SignInButton(
                  Buttons.Google,
                  text: 'Sign up with Google',
                  onPressed: () async {
                    GoogleSignInAccount signinAccount = await googleLogin.signIn();
                    if (signinAccount == null) return;

                    GoogleSignInAuthentication auth = await signinAccount.authentication;
                    final GoogleAuthCredential credential =
                    GoogleAuthProvider.credential(
                      idToken: auth.idToken,
                      accessToken: auth.accessToken,
                    );
                    User user =
                        (await FirebaseAuth.instance.signInWithCredential(credential))
                            .user;
                    if (user != null) {
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return MyPagee(user);
                        }),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
        ),
      );
  }
}
