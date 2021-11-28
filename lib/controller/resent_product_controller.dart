
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_init_to_null
import 'package:ecomerceflutter/model/resent_product_model.dart';
import 'package:ecomerceflutter/services/resent_product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ResentProductController extends GetxController{


  ValueNotifier<bool> get isloading=> _isloading;
  ValueNotifier<bool> _isloading= ValueNotifier(false);

  List<ResentProductModel> get resentProductModel =>_resentProductModel;
  List<ResentProductModel>  _resentProductModel =[];
  ResentProductController(){
    getProduct();
  }

  getProduct() async{
    _isloading.value = true ;
  await resentProductService().getResentProduct().then((value){
    _isloading.value = true ;
    value.forEach((age) {
      _resentProductModel.add(ResentProductModel.fromjson(age.data()));
      _isloading.value = false ;
    });
    update();
  });
 }
}