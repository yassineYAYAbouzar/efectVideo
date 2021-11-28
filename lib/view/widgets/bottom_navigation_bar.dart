import 'package:ecomerceflutter/controller/home_view_controller.dart';
import 'package:ecomerceflutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../constant.dart';

Widget bottomNavigbar(){
  return GetBuilder<HomeviewController>(
    init:HomeviewController() ,
    builder: (controller)=>BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad_outlined,),
          title: CustomText(text: 'Gaming', color: secondrycolor,size: 13,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          title: CustomText(text: 'Home', color: secondrycolor,size: 13,),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,),
          title: CustomText(text: 'Profile',size: 13,),
        ),
      ],
      currentIndex: controller.navigatorvalue,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(size: 40),
      selectedItemColor:primerycolor,
      unselectedItemColor: secondrycolor,
      onTap: (index){
        controller.changeSelectedValue(index);
      },
    ),
  );
}