import 'package:flutter/material.dart';
import 'package:mycolle_test_app/items_page_model.dart';
import 'package:provider/provider.dart';
import 'add_page.dart';
import 'items.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (BuildContext context) => ItemsModel()..fetchData(),
    child: Scaffold(
      appBar: AppBar(
        title: const Text('コレクション'),
      ),
      body: Consumer<ItemsModel>(builder: (context, model, child)  {
        final List<Items>? items = model.items;

        if (items == null) {
          return const CircularProgressIndicator();
        }

        final List<Widget> widgets = items
            .map((items) =>
            GestureDetector(
              onTap: (){},
              child: Stack(
                alignment: Alignment.center,
                children:[
                  Image.network('https://demo.a-blogcms.jp/media/001/201902/mode3_w400-7606c2743c3c40ddad9dc0c71f916329.png',
                    height: 170,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Text(items.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ),
                  ],
                  )
                ],
              ),
            ),
            )
            .toList();

        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0, // 縦
          mainAxisSpacing: 10.0, // 横
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: widgets
        );
      }
      ),
      floatingActionButton: Consumer<ItemsModel>(builder: (context, model,child) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddItemPage()),
              );
              await model.fetchData();
            },
          );
        }
      ),
      ),
    );
  }
}
