import 'package:ecommere_course/core/class/statusrequest.dart';
import 'package:ecommere_course/core/functions/handingdatacontroller.dart';
import 'package:ecommere_course/core/services/services.dart';
import 'package:ecommere_course/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommere_course/data/model/favoritemode.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<FavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .viewFavorite(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => FavoriteModel.fromJson(e)));
        //يفضل استخدامه علشان بستخدم Model
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteItems(String id) {
    var response = favoriteData.deleteFavorite(id);

    data.removeWhere((element) => element.favoriteId == id);
    print(response);
    update();
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }

  // goToPageProductDetails(favoriteModel) {
  //   Get.toNamed("productdetails", arguments: {"favoriteModel": favoriteModel});
  // }
}

// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }
