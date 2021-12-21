import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycolle_test_app/items.dart';

class AddItemModel with ChangeNotifier {
  final doc = FirebaseFirestore.instance
      .collection('collection') // コレクションID指定
      .doc('id_001') // ドキュメントID自動生成(collection)
      .collection('items')
      .doc() // ドキュメントID自動生成(items)
      .set({
      'title': title,
      'describe': describe,
      });


  void setTitle (String value){
      var title = value;
      notifyListeners();
  }

}