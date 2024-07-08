import 'dart:async';

import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/functions/handingdatacontroller.dart';
import 'package:ecommere_course/data/datasource/remote/orders/ordersdeatils_data.dart';
import 'package:ecommere_course/data/model/Orders_model.dart';
import 'package:ecommere_course/data/model/cartmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData testData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  late OrdersModel ordersModel;

  CameraPosition? cameraPosition;
  Position? position;
  Completer<GoogleMapController>? completer_controller;
  List<Marker> marker = [];
  double? long;
  double? lat;

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersdetails"];
    getLocatoin();
    getData();
    super.onInit();
  }

  getLocatoin() async {
    if(ordersModel.ordersType == "0"){
          cameraPosition = CameraPosition(
          target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
          zoom: 12);
      marker.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
      update();
    }

  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
