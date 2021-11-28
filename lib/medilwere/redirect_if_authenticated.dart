import 'package:ecomerceflutter/controller/home_view_controller.dart';
import 'package:ecomerceflutter/view/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RedirectIfAuth extends GetWidget<HomeviewController> {
  @override
  Widget build(BuildContext context) {
    return

          GetBuilder<HomeviewController>(
            builder: (controller) {
              return Scaffold(body: controller.curentscreen, bottomNavigationBar: bottomNavigbar(),);
            }
          );

  }
}

