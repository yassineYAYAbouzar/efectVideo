import 'package:ecomerceflutter/controller/ads_controller.dart';
import 'package:ecomerceflutter/controller/category_controller.dart';
import 'package:ecomerceflutter/controller/home_view_controller.dart';
import 'package:ecomerceflutter/controller/resent_product_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeviewController());
    Get.put(CategoryController());
    Get.put(AdsController());
    Get.put(ResentProductController());
  }

}