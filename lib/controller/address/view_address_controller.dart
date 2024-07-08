import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/functions/handingdatacontroller.dart';
import 'package:ecommere_course/core/services/services.dart';
import 'package:ecommere_course/data/datasource/remote/address_data.dart';
import 'package:ecommere_course/data/model/address_model.dart';
import 'package:get/get.dart';

class ViewAddressCOntroller extends GetxController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .viewData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletedata(String addressid) {
    var response = addressData.removeData(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    print(response);
    update();
  }

  

  @override
  void onInit() {
    getdata();

    // TODO: implement onInit
    super.onInit();
  }
}
