import 'package:ecommere_course/controller/home_controller.dart';
import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/functions/handingdatacontroller.dart';
import 'package:ecommere_course/core/services/services.dart';
import 'package:ecommere_course/data/datasource/remote/offer_data.dart';
import 'package:ecommere_course/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OfferController extends SearchController {
  OfferData offerData = OfferData(Get.find());
  List<ItemsModel> data = [];
  @override
  MyServices myServices = Get.find();
  @override
  late StatusRequest statusRequest;
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await offerData.getData(myServices.sharedPreferences.getString("id")!);
    print("===============================Offer Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata1 = response["data"];
        data.clear();
        data.addAll(listdata1.map((e) => ItemsModel.fromJson(e)));
        listdata1.clear();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrechData() {
    getData();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
