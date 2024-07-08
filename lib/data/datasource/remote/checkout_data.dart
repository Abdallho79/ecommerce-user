import 'package:ecommere_course/core/class/crud.dart';
import 'package:ecommere_course/linkapi.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);
  addCheckOut(Map data) async {
    var response = await crud.postData(AppLink.CheckOut, data);
    return response.fold((l) => l, (r) => r);
  }
}
