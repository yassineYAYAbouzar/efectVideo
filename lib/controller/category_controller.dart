
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_init_to_null
import 'package:ecomerceflutter/model/category_model.dart';
import 'package:ecomerceflutter/services/category_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController{


  ValueNotifier<bool> get isloading=> _isloading;
  ValueNotifier<bool> _isloading= ValueNotifier(false);

  List<CatgoryModel> get catgoryModel =>_catgoryModel;
  List<CatgoryModel>  _catgoryModel =[];
  CategoryController(){
    getCatgory();
  }

  getCatgory() async{
    _isloading.value = true ;
  await CategoryService().getAllCategory().then((value){
    _isloading.value = true ;
    value.forEach((age) {
      _catgoryModel.add(CatgoryModel.fromjson(age.data()));
      _isloading.value = false ;
    });
    update();
  });
 }
}