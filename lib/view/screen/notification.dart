import 'package:ecommere_course/controller/notification_controller.dart';
import 'package:ecommere_course/core/class/handlingdataview.dart';
import 'package:ecommere_course/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  const Center(
                    child: Text(
                      "Notification",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...List.generate(
                      controller.data.length,
                      (index) => Stack(
                            children: [
                              Positioned(
                                  right: 20,
                                  child: Text(
                                    Jiffy.parse(controller.data[index]
                                            ["notification_time"])
                                        .fromNow(),
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                              ListTile(
                                title: Text(controller.data[index]
                                    ["notification_title"]),
                                subtitle: Text(controller.data[index]
                                    ["notification_body"]),
                              ),
                            ],
                          ))
                ],
              ),
            )));
  }
}
