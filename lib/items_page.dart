import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'add_page.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コレクション'),
      ),
      body: Column(
        children: [
          Expanded(
            // FutureBuilder
            // 非同期処理の結果を元にWidgetを作れる
            child: FutureBuilder<QuerySnapshot>(
              // 一覧を取得（非同期処理）
              future:FirebaseFirestore.instance
                  .collection('collection')
                  .doc('id_001')
                  .collection('items')
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
                    // 取得した一覧を元にリスト表示
                    return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0, // 縦
                    mainAxisSpacing: 10.0, // 横
                    childAspectRatio: 0.86, // 高さ
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    children: documents.map((document) {
                      return Column(
                      children: List.generate(1, (index) {
                      return Column(
                      children: [
                      GestureDetector(
                      onTap: (){},
                      child: Image.network('https://beefup.work/wp-content/uploads/2019/12/FlutterFavoriteLogo-c581613beba0abd3a92fa9d1c86e7b38062f92d104347a3a6bb28841233331fd.png',
                      height: 170,
                      width: 170,
                      fit: BoxFit.cover,
                      ),
                      ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(document['title']),//●タイトルが長過ぎた時の改行せずに・・・にする
                        ),
                      ],
                      );
                      }),
                      );
                    }).toList(),
                  );
                }
                // データが読込中の場合
                return Center(
                  child: Text('読込中...'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          );
          final document = FirebaseFirestore.instance
              .collection('collection')
              .doc('id_001')
              .collection('items')
              .get();
          // 取得したドキュメントの情報をUIに反映
          setState(() {
          '${document['title']}';
          });
          },
      ),
    );
  }
}
