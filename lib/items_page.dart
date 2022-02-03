import 'package:flutter/material.dart';
import 'package:mycolle_test_app/items_page_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => ItemsPageModel(),
    child: Consumer<ItemsPageModel>(builder: (context, model, child)  {
        return Scaffold(
                appBar: AppBar(
                  title: Text('Google Sign In'),
                ),
                body: Container(
                    child: ElevatedButton(
                      child: const Text('Google'),
                      onPressed: () async {
                        await model.signInWithGoogle();
                        if (model.login_flg == true) {
                          print('ログイン成功');
                        } else {
                          print('ログイン失敗');
                        }
                      },
                    ),
                ),
            );
       }
     ),
    );
      }
  }

