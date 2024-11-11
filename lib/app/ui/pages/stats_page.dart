import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(2.0),
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: MyColors().gradientHomePage()),
        child: SizedBox.expand(
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(gradient: MyColors().gradientHomePage()),
                  child: SizedBox.expand(
                      child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Card(
                        color: Colors.black.withOpacity(.2),
                        elevation: 20,
                        child: SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'ESTATÍSTICAS',
                              style: TextStyle(
                                  color: MyColors().titleColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Flexible(
                flex: 12,
                child: DecoratedBox(
                    decoration:
                        BoxDecoration(gradient: MyColors().gradientHomePage()),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox.expand(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Divider(),
                              Text('Conteúdo'),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
