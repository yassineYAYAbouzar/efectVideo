import 'package:ecomerceflutter/view/home_page.dart';
import 'package:ecomerceflutter/view/offers_page.dart';
import 'package:ecomerceflutter/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
class HomeviewController extends GetxController{
   int _navigatorvalue = 1;
   get navigatorvalue => _navigatorvalue;

   Widget _curentscreen = HomePage();
   get curentscreen => _curentscreen;

   void changeSelectedValue(int selectedValue){
     switch(selectedValue){
       case 0 :{
         _curentscreen = OffersPage();
         break;
       }
       case 1:{
         _curentscreen = HomePage();
         break;
       }
       case 2:{
         _curentscreen = ProfileView();
         break;
       }
     }
     _navigatorvalue = selectedValue;
     update();
   }
   @override
   void onInit() {
     super.onInit();
   }
}