import 'package:ecomerceflutter/adds/bannar_class.dart';
import 'package:ecomerceflutter/adds/interstiial.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
class AdsController extends GetxController{
  BannarClass _bannarcla = BannarClass();
  InterClassState _inter = InterClassState();
  InterClassState _inter1 = InterClassState();
  InterClassState get inter => _inter;
  InterClassState get inter1 => _inter1;
  BannarClass get bannarcla => _bannarcla;
  @override
  void onInit() {
    super.onInit();
    bannarcla.myBanner.load(); //
    bannarcla.myBanner2.load(); //
    inter1.createInterstitialAd();
    inter.createInterstitialAd();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    inter1.interstitialAd.dispose();
    inter.interstitialAd.dispose();
    bannarcla.myBanner.dispose();
    bannarcla.myBanner2.dispose();
  }
}