import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycolle_test_app/items_page_model.dart';
import 'package:provider/provider.dart';
import 'add_page.dart';

class MyHomePage extends StatelessWidget {

  String colletitle = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (BuildContext context) => ItemsModel(),
    child: Scaffold(
      appBar: AppBar(
        title: Text('コレクション'),
      ),
      body: Consumer<ItemsModel>(builder: (context, model,child) {
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0, // 縦
            mainAxisSpacing: 10.0, // 横
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: List.generate(3, (index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Stack(
                      alignment: Alignment.center,
                      children:[
                        Container(
                          child: Image.network('https://demo.a-blogcms.jp/media/001/201902/mode3_w400-7606c2743c3c40ddad9dc0c71f916329.png',
                            height: 170,
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(colletitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          );
          // コレクションIDとドキュメントIDを指定して取得
          final document = await FirebaseFirestore.instance
              .collection('collection')
              .doc('id_001')
              .get();
          // 取得したドキュメントの情報をUIに反映
          // setState(() {
          //   titleee =
          //   '${document['title']}';
          // });
        },
      ),
      ),
    );
  }
}
