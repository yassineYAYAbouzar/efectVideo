import 'package:cloud_firestore/cloud_firestore.dart';

class resentProductService {
  CollectionReference _productref = FirebaseFirestore.instance.collection('product');
  Future<List<QueryDocumentSnapshot>> getResentProduct() async {
    var value =await _productref.get();
        return value.docs;
  }
}