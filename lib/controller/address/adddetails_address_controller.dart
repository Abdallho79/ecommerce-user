import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/constant/routes.dart';
import 'package:ecommere_course/core/functions/handingdatacontroller.dart';
import 'package:ecommere_course/core/services/services.dart';
import 'package:ecommere_course/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressControllerDetails extends GetxController {
  StatusRequest? statusRequest;
  String? lat;
  String? long;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? phone;
  TextEditingController? home;
  TextEditingController? note;
  TextEditingController? floor;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  initailData() {
    statusRequest = StatusRequest.loading;
    update();
    lat = Get.arguments["lat"].toString();
    long = Get.arguments["long"].toString();
    print(lat);
    print(long);

    statusRequest = StatusRequest.success;
    update();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        phone!.text,
        city!.text,
        street!.text,
        long!,
        lat!,
        home!.text,
        floor!.text,
        note!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offAllNamed(AppRoute.homepage);
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    home = TextEditingController();
    floor = TextEditingController();
    note = TextEditingController();
    initailData();
    super.onInit();
  }
}
