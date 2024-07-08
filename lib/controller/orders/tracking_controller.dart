import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/functions/polyLine.dart';
import 'package:ecommere_course/core/services/services.dart';
import 'package:ecommere_course/data/model/Orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrdersController extends GetxController {
  GoogleMapController? gmc;
  CameraPosition? cameraPosition;
  List<Marker> marker = [];
  StatusRequest statusRequest = StatusRequest.success;
  MyServices myServices = Get.find();
  late OrdersModel ordersModel;
  Set<Polyline> polylineSet = {};
  double? destlat;
  double? destlong;
  double? currenttlat;
  double? currenttlont;

  getCurrentLocation() {
    cameraPosition = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12.4746);

    marker.add(Marker(
        markerId: const MarkerId("cerrent"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));

    update();
  }


  getDeliveryLocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event != null) {
        destlat = event.get("Lat");
        destlong = event.get("Long");
        updateMarekerDelivery(destlat!, destlong!);
      }
    });
  }

  updateMarekerDelivery(double newlat, double newlong) {
    marker.removeWhere((element) => element.markerId.value == "dest");
    marker.add(Marker(
        markerId: const MarkerId("dest"), position: LatLng(newlat, newlong)));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    getCurrentLocation();
    getDeliveryLocation();
    // reFrechLocation();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
  
  // initPolyLine() async {
  //   destlat = ordersModel.addressLat!;
  //   destlong = ordersModel.addressLong!;
  //   print("==========================================");
  //   print("currenttlat $currenttlat");
  //   print("currenttlont $currenttlont");
  //   print("destlat $destlat");
  //   print("destlong $destlong");
  //   print("==========================================");
  //   await Future.delayed(const Duration(seconds: 1));
  //   polylineSet =
  //       await getPolyLine(currenttlat!, currenttlont!, destlat!, destlong!);
  //   update();
  // }
}
