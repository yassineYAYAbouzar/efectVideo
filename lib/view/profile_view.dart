import 'package:ecomerceflutter/view/widgets/custom_SocialAccontBox.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

import 'package:ecomerceflutter/constant.dart';

import 'package:ecomerceflutter/view/widgets/custom_text.dart';
import 'package:ecomerceflutter/view/widgets/custom_text_field.dart';

class ProfileView extends StatelessWidget {
  final List<String> names = <String>['Offres','Sri Lanka','Offres','Sri Lanka','Offres','Sri Lanka'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(alignments: Alignment.topLeft, text: "  Profile",size: 19.9,color: greycolor,),
        elevation: 0,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.videogame_asset,color:primerycolor,),
        )],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical ,
          children: [
            Container(
              height: 100,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                AssetImage("images/av1.png"),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit,color: primerycolor,),
                  CustomText(text: 'Edite Profile',alignments: Alignment.center,size: 12,color: primerycolor,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            CustomText(text: 'Hi there !',alignments: Alignment.center,size: 20,fontWeight: FontWeight.w700,),
            SizedBox(height: 20,),
            CustomText(text: 'Sign Out',alignments: Alignment.center,size: 17,color: primerycolor),
            SizedBox(height: 40,),
            CustomTextFilde(label: Text('name'),hint: 'Exemple ',),
            SizedBox(height: 20,),
            CustomTextFilde(label: Text('Email'),hint: 'Exemple@gmail.com',),
            SizedBox(height: 20,),
            CustomTextFilde(label: Text('Mobile'),hint: '+212602610742',),
            SizedBox(height: 20,),
            CustomTextFilde(label: Text('Adsress'),hint: 'Exemple EL Exemple Exemple N Exemple',),
            SizedBox(height: 20,),
            CustomTextFilde(label: Text('Password'),hint: '*******************',),
            SizedBox(height: 20,),
            CustomTextFilde(label: Text('Confirm Password'),hint: '*******************',),
            SizedBox(height: 20,),
            CustomSocialAccontBox(color:primerycolor,text:'Save ',isNotSocial:false,)
          ],
        ),
      ),
    );
  }
}
