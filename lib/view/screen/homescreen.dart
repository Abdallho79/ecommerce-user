import 'dart:io';

import 'package:ecommere_course/controller/homescreen_controller.dart';
import 'package:ecommere_course/core/constant/color.dart';
import 'package:ecommere_course/core/constant/routes.dart';
import 'package:ecommere_course/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.myCart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(
                  child: controller.listPage.elementAt(controller.currentpage),
                  onWillPop: () {
                    Get.defaultDialog(
                        titleStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        cancelTextColor: AppColor.secondColor,
                        confirmTextColor: AppColor.secondColor,
                        buttonColor: AppColor.thirdColor,
                        title: "Warning",
                        middleText: "Do You Sure To Exit App",
                        onConfirm: () {
                          exit(0);
                        },
                        onCancel: () {});
                    return Future.value(false);
                  }),
            ));
  }
}
