import 'package:flutter/material.dart';
import 'package:fly/utils/style.dart';
import 'package:fly/view/coding_screen/coding_screen.dart';
import 'package:fly/view/preparation_screen/preparation_screen.dart';
import 'package:fly/view/projects_list/project_list_screen.dart';
import 'package:fly/view/report_screen/report_screen.dart';
import 'package:fly/view/shared_widgets/public_screen_body.dart';
import 'package:fly/view/to_do_list/to_do_list_screen.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({Key? key}) : super(key: key);
  final List<String> titles = [
    'preparation screen',
    'to do list',
    'projects list',
    'Reports',
    'Coding screen',
    'work plans',
  ];
  final List<Widget> screens = const [
    PublicScreenBody(
      singleScreen: PreparationScreen(),
      title: 'preparation screen',
    ),
    PublicScreenBody(
      singleScreen: ToDoListScreen(),
      title: 'to do list',
    ),
    PublicScreenBody(
      singleScreen: ProjectListScreen(),
      title: 'projects list',
    ),
    PublicScreenBody(
      singleScreen: ReportScreen(),
      title: 'Reports',
    ),
    PublicScreenBody(
      singleScreen: CodingScreen(),
      title: 'Coding screen',
    ),
    PublicScreenBody(
      singleScreen: PreparationScreen(),
      title: 'work plans',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 19),
      padding: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: GridView.builder(
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20),
          itemCount: 6,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                // Get.to(screens[index]);
                pushNewScreen(context, screen: screens[index]);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: lightPrimaryColor),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 6,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 9,
                      padding: const EdgeInsets.all(3),
                      child: Image.asset(
                        "assets/images/$index.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 22,
                      decoration: const BoxDecoration(
                          color: lightPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(60),
                              topLeft: Radius.circular(60),
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50))),
                      child: Text(
                        titles[index].tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'hanimation',
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
