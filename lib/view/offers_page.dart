
// ignore_for_file: prefer_const_constructors

import 'package:ecomerceflutter/constant.dart';
import 'package:ecomerceflutter/controller/ads_controller.dart';
import 'package:ecomerceflutter/controller/home_view_controller.dart';
import 'package:ecomerceflutter/controller/resent_product_controller.dart';
import 'package:ecomerceflutter/view/detaile_product_view.dart';
import 'package:ecomerceflutter/view/profile_view.dart';
import 'package:ecomerceflutter/view/widgets/custom_SocialAccontBox.dart';
import 'package:ecomerceflutter/view/widgets/custom_text.dart';
import 'package:ecomerceflutter/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(alignments: Alignment.topLeft, text: " Squid Game Now",size: 19.9,color: greycolor,),
        elevation: 0,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.videogame_asset,color:primerycolor,),
        )],
      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10), child: ListView(
          children: [
            SizedBox(height: 50,),
            Center(
              child: GetBuilder<AdsController>(
                  builder: (controller) {
                    return SizedBox(
                      height: controller.bannarcla.myBanner2.size.height
                          .toDouble(), // sets container height
                      width: controller.bannarcla.myBanner2.size.width
                          .toDouble(), // sets container width
                      child: AdWidget(
                        ad: controller.bannarcla
                            .myBanner2, // ad must be loaded before insertion to widget tree
                      ),
                    );
                  }
              ),
            ),
            SizedBox(height: 20,),
            ListviewFoodVirtical()
          ],
        ),
      ),
    );
  }
  Widget ListviewFoodVirtical() {
    return GetBuilder<ResentProductController>(
        init: Get.find(),
        builder: (controller) {
          return controller.isloading.value ? Center(child: CircularProgressIndicator()): SizedBox(
            height: 400,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount:  controller.resentProductModel.length,
              itemBuilder: (context, index) {
                {
                  return InkWell (
                    onTap: () {
                      Get.to(() => DetaileProductView(model: controller.resentProductModel[index]));
                      print( controller.resentProductModel[index].name);
                    },
                    child: Column(
                      children: [
                        Image.network(controller.resentProductModel[index].image ) ,
                        SizedBox(height: 10,),
                        CustomText(text:controller.resentProductModel[index].name,
                          alignments: Alignment.topLeft,
                          size: 17,
                          fontWeight: FontWeight.bold,),
                        Row(
                          children: [
                            Icon(Icons.star, color: primerycolor,),
                            CustomText(text: ' 4,9',
                              alignments: Alignment.topLeft,
                              color: primerycolor,
                              size: 17,),
                            CustomText(text: ' The picture shows us the moment',
                              alignments: Alignment.topLeft,
                              color: greycolor,
                              size: 17,),
                          ],
                        )
                      ],
                    ),
                  );
                }
              }
              , separatorBuilder: (context, index) => SizedBox(height: 20,),
            ),
          );
        }
    );
  }}