import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  // 入力した投稿メッセージ
  String title = '';
  String describe = '';

  @override
  Widget build(BuildContext context) {
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
                // 複数行のテキスト入力
                keyboardType: TextInputType.multiline,
                onChanged: (String value) {
                  setState(() {
                    title = value;
                  });
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
                    await FirebaseFirestore.instance
                        .collection('items') // コレクションID指定
                        .doc() // ドキュメントID自動生成
                        .set({
                      'title': title,
                      'describe': describe,
                    });
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
}