import 'package:flutter/material.dart';
import 'package:mycolle_test_app/add_page_model.dart';
import 'package:provider/provider.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddItemModel>(
        create: (BuildContext context) => AddItemModel(),
        child: Consumer<AddItemModel>(builder: (context, model,child) {
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
                      // 投稿メッセージ入力
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'タイトル'),
                        onChanged: (text) {
                          model.title = text;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: '説明'),
                        // 複数行のテキスト入力
                        keyboardType: TextInputType.multiline,
                        onChanged: (text) {
                          model.describe = text;
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('追加'),
                          onPressed: () async {
                            try {
                              await model.addItem();
                            } catch (e) {
                              final snackBar = SnackBar(
                                content: Text(e.toString()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            // 1つ前の画面に戻る
                            Navigator.of(context).pop();
                          },
                        ),
                      )
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
