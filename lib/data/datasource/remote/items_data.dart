import 'package:ecommere_course/core/class/crud.dart';
import 'package:ecommere_course/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(AppLink.items, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
