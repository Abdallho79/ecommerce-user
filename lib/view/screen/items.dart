import 'package:ecommere_course/controller/favorite_controller.dart';
import 'package:ecommere_course/controller/items_controller.dart';
import 'package:ecommere_course/core/class/handlingdataview.dart';
import 'package:ecommere_course/core/constant/routes.dart';
import 'package:ecommere_course/data/model/itemsmodel.dart';
import 'package:ecommere_course/view/screen/home.dart';
import 'package:ecommere_course/view/widget/customappbar.dart';
import 'package:ecommere_course/view/widget/items/customlistitems.dart';
import 'package:ecommere_course/view/widget/items/listcategoirseitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            titleappbar: "Find Product",
            onPressedIcon: () {
              Get.toNamed(AppRoute.myFavorite);
            },
            onPressedSearch: () {
              controller.onSearch();
            },
            onChanged: (String val) {
              controller.checkSearch(val);
            },
            mycontroller: controller.search,
          ),
          const SizedBox(height: 20),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearrch == false
                      ? Column(
                          children: [
                            const ListCategoriesItems(),
                            GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7),
                                itemBuilder: (BuildContext context, index) {
                                  favoriteController.isFavorite[controller
                                      .data[index]["items_id"]
                                      .toString()] = controller.data[index]
                                          ["favorite"]
                                      .toString();
                                  return CustomListItems(
                                      itemsModel: ItemsModel.fromJson(
                                          controller.data[index]));
                                }),
                          ],
                        )
                      : ListItemSearch(
                          listdataSearch: controller.listdata)))
        ]),
      ),
    );
  }
}
