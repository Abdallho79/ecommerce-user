import 'package:ecommere_course/controller/productdetails_controller.dart';
import 'package:ecommere_course/core/class/handlingdataview.dart';
import 'package:ecommere_course/core/constant/color.dart';
import 'package:ecommere_course/core/constant/routes.dart';
import 'package:ecommere_course/view/widget/productdetails/priceandcount.dart';
import 'package:ecommere_course/view/widget/productdetails/subitemslist.dart';
import 'package:ecommere_course/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.myCart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: AppColor.fourthColor,
                                  )),
                          const SizedBox(height: 10),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              price:
                                  "${controller.itemsModel.itemspricediscount}",
                              count: controller.count.toString()),
                          const SizedBox(height: 10),
                          Text("${controller.itemsModel.itemsDesc}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.grey2)),
                          const SizedBox(height: 10),
                          Text("Color",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    color: AppColor.fourthColor,
                                  )),
                          const SizedBox(height: 10),
                          const SubitemsList()
                        ]),
                  )
                ]))));
  }
}
