import 'dart:async';

import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  Completer<GoogleMapController>? completer_controller;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? long;
  double? lat;
  addMarkers(LatLng latLng) {
    long = latLng.longitude;
    lat = latLng.latitude;
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    update();
  }

  getCurrentLocatoin() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 14);
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToAddDetails() {
    print(long);
    print(lat);
    Get.toNamed(AppRoute.addressadddetails, arguments: {
      "long": long.toString(),
      "lat": lat.toString(),
    });
  }

  @override
  void onInit() {
    getCurrentLocatoin();
    completer_controller = Completer<GoogleMapController>();
    super.onInit();
  }
}
