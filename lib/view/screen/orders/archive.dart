import 'package:ecommere_course/controller/orders/archive_controller.dart';
import 'package:ecommere_course/core/class/handlingdataview.dart';
import 'package:ecommere_course/view/widget/orders/orderslistcardarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Archive"),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ArchiveController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CardOrderListArchvie(
                        model: controller.data[index],
                      );
                    },
                  )))),
    );
  }
}
