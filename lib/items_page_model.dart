import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mycolle_test_app/items.dart';

class ItemsModel with ChangeNotifier {

  final Stream<QuerySnapshot> _dat =  FirebaseFirestore.instance
      .collection('collection')
      .doc('id_001')
      .collection('items')
      .snapshots();

  List<Items>? items;

  void fetchData () {
    _dat.listen((QuerySnapshot snapshot) {
      List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        final String title = data['title'];
        final String describe = data['describe'];
        return Items(title, describe);
      }).toList();
      this.items = items;
      notifyListeners();
    });
   }

  }