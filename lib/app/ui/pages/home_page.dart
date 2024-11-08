import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:class_manager/app/ui/ui_elements/image_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(2.0),
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: MyColors().gradientHomePage()),
        child: SizedBox.expand(
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  imageWidget(
                      'assets/image/predioPrincipal.jpg', 15, Alignment.center),
                  imageShimmerWidget(
                      'assets/image/logoMaua1.gif', 15, Alignment.bottomCenter),
                ]),
              ),
              Flexible(
                flex: 8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      gradient: MyColors().gradientHomePage()),
                  child: SizedBox(
                      height: height,
                      width: width * .98,
                      child: const SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text('Home Page'),
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
