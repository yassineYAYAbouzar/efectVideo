import 'package:cloud_firestore/cloud_firestore.dart';

class ResentProductModel{
   String name,image,description;
   Timestamp created_at;
   int price;

   ResentProductModel({this.name, this.image,this.created_at, this.description, this.price});
   ResentProductModel.fromjson(Map<dynamic, dynamic> map){
       if(map== null){
          return ;
       }
       created_at =map['created_at'];
       description =map['description'];
       image =map['image'];
       name =map['name'];
       price =map['price'];
   }
   tojson(){
    return{
      'created_at':created_at,
      'description':description,
      'image':image,
      'name':name,
      'price':price,
    };
   }
}