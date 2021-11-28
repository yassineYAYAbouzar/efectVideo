import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {
  CollectionReference _categoryref = FirebaseFirestore.instance.collection('category');
  Future<List<QueryDocumentSnapshot>> getAllCategory() async {
    var value =await _categoryref.get();
        return value.docs;
  }
}