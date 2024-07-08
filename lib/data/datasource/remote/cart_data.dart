import 'package:ecommere_course/core/class/crud.dart';
import 'package:ecommere_course/linkapi.dart';

class CartDat {
  Crud crud;
  CartDat(this.crud);
  addCart(String id, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"usersid": id, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String id, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartremove, {"usersid": id, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  countCart(String id, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartcount, {"usersid": id, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String id) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": id});
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String name) async {
    var response = await crud.postData(AppLink.checkcoupon, {"couponname": name});
    return response.fold((l) => l, (r) => r);
  }
}
