import 'package:flutter/material.dart';
import 'package:fly/view/home/widgets/home_body.dart';
import 'package:fly/view/shared_widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// header
              const HeaderWidget(
                arrow: false,
              ),

              /// Home Body

              HomeBodyWidget(),

              /*
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TestMapScreen();
                    }));
                  },
                  icon: const Icon(Icons.maps_ugc)),

                  */
            ],
          ),
        ),
      ),
    );
  }
}
