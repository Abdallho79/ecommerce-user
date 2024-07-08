import 'package:ecommere_course/core/class/crud.dart';
import 'package:ecommere_course/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.detailsorder, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

}
