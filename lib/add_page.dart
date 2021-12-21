import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycolle_test_app/add_page_model.dart';
import 'package:provider/provider.dart';

class AddItemPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => AddItemModel(),
        child: Consumer<AddItemModel>(builder: (context, model,child) {
            return Scaffold(
              appBar: AppBar(
                title: Text('追加'),
              ),
              body: Center(
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // 投稿メッセージ入力
                      TextFormField(
                        decoration: InputDecoration(labelText: 'タイトル'),
                        onChanged: (String value) {

                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: '説明'),
                        // 複数行のテキスト入力
                        keyboardType: TextInputType.multiline,
                        onChanged: (String value) {
                          setState(() {
                            describe = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('追加'),
                          onPressed: () async {
                            // 投稿メッセージ用ドキュメント作成
                            await
                            // 1つ前の画面に戻る
                            Navigator.of(context).pop(title);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}
