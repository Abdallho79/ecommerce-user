import 'package:ecommere_course/view/screen/home.dart';
import 'package:ecommere_course/view/screen/notification.dart';
import 'package:ecommere_course/view/screen/offer.dart';
import 'package:ecommere_course/view/screen/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    const Offers(),
    const Settings(),
  ];

  List titlebottomappbar = [
    {"icon": Icons.home},
    {"icon": Icons.notification_add_outlined},
    {"icon": Icons.local_offer_outlined},
    {"icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
