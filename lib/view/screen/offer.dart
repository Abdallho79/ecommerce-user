import 'package:ecommere_course/controller/favorite_controller.dart';
import 'package:ecommere_course/controller/offer_controller.dart';
import 'package:ecommere_course/core/class/handlingdataview.dart';
import 'package:ecommere_course/core/constant/routes.dart';
import 'package:ecommere_course/view/screen/home.dart';
import 'package:ecommere_course/view/widget/customappbar.dart';
import 'package:ecommere_course/view/widget/offercoustom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    Get.put(FavoriteController());
    controller.refrechData();

    return GetBuilder<OfferController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
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
                controller.isSearrch == false
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onDoubleTap: () => print(
                                "===========${controller.data[index].favorite}====${controller.data[index].itemsId is String}======${controller.data[index].favorite == "1"}==================="),
                            child: CustomListItemsOffer(
                                itemsModel: controller.data[index]),
                          );
                        }))
                    : ListItemSearch(listdataSearch: controller.listdata)
              ],
            ),
          ));
    });
  }
}
