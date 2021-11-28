
// ignore_for_file: prefer_const_constructors
import 'package:ecomerceflutter/constant.dart';
import 'package:ecomerceflutter/controller/ads_controller.dart';
import 'package:ecomerceflutter/controller/category_controller.dart';
import 'package:ecomerceflutter/controller/resent_product_controller.dart';
import 'package:ecomerceflutter/view/detaile_product_view.dart';
import 'package:ecomerceflutter/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(alignments: Alignment.topLeft, text: " Squid Game",size: 19.9,color: greycolor,),
        elevation: 0,
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.videogame_asset,color:primerycolor,),
        )],
      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10), child: ListView(
          children: [
            SizedBox(height: 30,),
        Center(
          child: GetBuilder<AdsController>(
            builder: (controller) {
              return SizedBox(
                height: controller.bannarcla.myBanner.size.height
                    .toDouble(), // sets container height
                width: controller.bannarcla.myBanner.size.width
                    .toDouble(), // sets container width
                child: AdWidget(
                  ad: controller.bannarcla
                      .myBanner, // ad must be loaded before insertion to widget tree
                ),
              );
            }
          ),
        ),
            SizedBox(height: 30,),
            ListviewFoodHorisontal(),
            ListviewFoodVirtical()
          ],
        ),
      ),
    );
  }
  Widget ListviewFoodHorisontal(){
    return  GetBuilder<CategoryController>(
      builder: (controller) {
        return controller.isloading.value ? Center(child: CircularProgressIndicator()): SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.catgoryModel.length,
            itemBuilder: ( context, index){
              {
                return  GetBuilder<AdsController>(
                  builder: (controllers) {
                    return InkWell(
                      onTap: (){
                        controllers.inter1.showInterstitialAd();
                      },

                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:NetworkImage(controller.catgoryModel[index].image,scale: 2),
                            )

                          ],
                        ),

                    );
                  }
                );
              }
            }
            ,separatorBuilder: (context,index)=> SizedBox(width: 20,),
          ),
        );
      }
    );
  }
  Widget ListviewFoodVirtical() {
    return GetBuilder<ResentProductController>(
      init: Get.find(),
      builder: (controller) {
        return controller.isloading.value ? Center(child: CircularProgressIndicator()): SizedBox(
          height: 340,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount:  controller.resentProductModel.length,
            itemBuilder: (context, index) {
              {
                return GetBuilder<AdsController>(
                  builder: (controllers) {
                    return InkWell (
                      onTap: () {
                        controllers.inter.showInterstitialAd();
                       Get.to(() => DetaileProductView(model: controller.resentProductModel[index]));
                       print( controller.resentProductModel[index].name);
                      },
                      child: Column(
                        children: [
                          Image.network(controller.resentProductModel[index].image ,height: 240,fit:BoxFit.cover,width: double.infinity,) ,
                          SizedBox(height: 10,),
                          CustomText(text:controller.resentProductModel[index].name,
                            alignments: Alignment.topLeft,
                            size: 17,
                            fontWeight: FontWeight.bold,),
                          Row(
                            children: [
                              Icon(Icons.star, color: primerycolor,),
                              CustomText(text: ' 4.9',
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
                );
              }
            }
            , separatorBuilder: (context, index) => SizedBox(height: 20,),
          ),
        );
      }
    );
  }}