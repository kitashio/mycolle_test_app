import 'package:flutter/material.dart';
import 'package:mycolle_test_app/firestore_test_model.dart';
import 'package:provider/provider.dart';

class FirestoreTestPage extends StatelessWidget {
  const FirestoreTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirestoreTestModel>(
      create: (BuildContext context) => FirestoreTestModel(),
      child: Consumer<FirestoreTestModel>(builder: (context, model,child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('追加'),
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network('',
                    height: 170,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
