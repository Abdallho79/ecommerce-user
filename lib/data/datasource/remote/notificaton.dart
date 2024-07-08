import 'package:ecommere_course/core/class/crud.dart';
import 'package:ecommere_course/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.notification, {"usersid" : usersid});
    return response.fold((l) => l, (r) => r);
  }
}
