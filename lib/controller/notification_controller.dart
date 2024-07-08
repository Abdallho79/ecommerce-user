import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/functions/handingdatacontroller.dart';
import 'package:ecommere_course/core/services/services.dart';
import 'package:ecommere_course/data/datasource/remote/notificaton.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationData testData = NotificationData(Get.find());
  MyServices myServices = Get.find();
  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await testData.getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== NotificationData $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
