import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsModel extends ChangeNotifier {

  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance
      .collection('collection').snapshots();


  void fetchItems(){

  }

  
}