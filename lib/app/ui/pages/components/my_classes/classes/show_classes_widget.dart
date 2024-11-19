import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowClassesWidget extends StatefulWidget {
  final Discipline discipline;
  const ShowClassesWidget({super.key, required this.discipline});

  @override
  State<ShowClassesWidget> createState() => _ShowClassesWidgetState();
}

class _ShowClassesWidgetState extends State<ShowClassesWidget> {
  List<SchoolClass> list = [];

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    context.watch<SchoolClassStore>();
    list.clear();
    list.addAll(widget.discipline.classes!);
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: MyColors().gradientHomePageTitle(),
            borderRadius: BorderRadius.circular(12),
            border: Border.fromBorderSide(
                BorderSide(color: MyColors().titleColor))),
        child: SizedBox(
          // height: heigth,
          // width: width,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.all(8),
                //   child: Center(
                //     child: Text('${widget.discipline.longName}')
                //         .removeNullAndEditSize(25),
                //   ),
                // ),
                // Divider(
                //   indent: 40,
                //   endIndent: 40,
                // ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: list.length,
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            elevation: 15,
                            shadowColor: MyColors().paletteColor3,
                            color: MyColors().titleColor,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(45, 8, 45, 8),
                              child: Text(
                                '${list[index].name}',
                                style:
                                    TextStyle(color: MyColors().paletteColor3),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: MyColors().gradientHomePageTitle(),
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.fromBorderSide(BorderSide(
                                      color: MyColors().titleColor))),
                              child: SizedBox(
                                height: heigth * .5,
                                width: width,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
