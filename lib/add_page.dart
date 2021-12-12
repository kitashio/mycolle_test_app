import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  String title = '';
  String describe = '';
  String imgURL = '';

  late File _image;
  final picker = ImagePicker();

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
              //画像アップデート
              IconButton(
                onPressed: () async {
                  final pickedFile = await picker.getImage(source: ImageSource.gallery);

                  setState(() {
                    _image = File(imgURL);
                  });
                },
                icon: Icon(Icons.add),
              ),
              // 投稿メッセージ入力
              TextFormField(
                decoration: InputDecoration(labelText: 'タイトル'),
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
                        .collection('collection') // コレクションID指定
                        .doc('id_001') // ドキュメントID自動生成(collection)
                        .collection('items')
                        .doc() // ドキュメントID自動生成(items)
                        .set({
                      'title': title,
                      'describe': describe,
                    });
                    // 1つ前の画面に戻る
                    Navigator.of(context).pop(_image);
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
