import 'package:ecommere_course/core/class/crud.dart';
import 'package:ecommere_course/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  viewFavorite(String id) async {
    int x = 0;
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    print("==================================== ${x++} ==========================");
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String itemsid) async {
    var response =
        await crud.postData(AppLink.deletefromfavroite, {"id": itemsid});
    print("delte dataremote");
    return response.fold((l) => l, (r) => r);
  }
}
