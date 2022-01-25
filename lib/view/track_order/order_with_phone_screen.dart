import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fly/core/controller/oreders_controller.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/shared_widgets/custom_loader.dart';
import 'package:fly/view/shared_widgets/custom_no_data.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';
import 'package:fly/view/shared_widgets/line_dot.dart';
import 'package:fly/view/track_order/widgets/single_report_item_widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderWithPhoneScreen extends StatelessWidget {
  OrderWithPhoneScreen({Key? key, required this.phone}) : super(key: key);
  final int phone;

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.put(OrdersController(phone));
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OrdersController>(
            init: OrdersController(phone),
            builder: (control) {
              return controller.loading == true
                  ? const LoaderWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          //header
                          const HeaderWidget(arrow: true),
                          //
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          // title
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 20,
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //   width: 1,
                            //   color: primaryColor,
                            // )
                            // ),
                            child: const Text(
                              "البلاغات",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // divider
                          const LineDots(),
                          //Report List
                          controller.oredersByPhone.isEmpty?
                          // NoData Widget
                          const NoDataWidget():
                          // List of Reports
                          
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            // width: MediaQuery.of(context).size.width / 1.3,
                            height: MediaQuery.of(context).size.height / 1.4,
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //   width: 2.0,
                            //   color: Colors.blue,
                            // )
                            // ),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                itemCount: controller.oredersByPhone.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: SingleReportItemWidget(
                                          noticeClassifyType: controller.oredersByPhone[index].noticeClassifyType,
                                          status: controller.oredersByPhone[index].status ,
                                          date:  controller.oredersByPhone[index].date,
                                        )
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    );
            }),
      ),
    );
  }
}
