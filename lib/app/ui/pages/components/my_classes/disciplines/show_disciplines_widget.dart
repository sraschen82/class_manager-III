import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/stores/discipline_store.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/create_discipline_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/show_discipline_options.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDisciplinesWidget extends StatefulWidget {
  const ShowDisciplinesWidget({super.key});

  @override
  State<ShowDisciplinesWidget> createState() => _ShowDisciplinesWidgetState();
}

class _ShowDisciplinesWidgetState extends State<ShowDisciplinesWidget> {
  List<bool> selectedList = [];
  List<Discipline> list = [];
  Discipline selectedDiscipline = Discipline.empty();
  bool showDisciplineOptions = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        int year = context.read<DataBase>().user.schoolYears.first.year!;

        await context.read<DisciplineStore>().getAllDiscilpine(year: year).then(
          (value) {
            list.addAll(value);
            selectedDiscipline = value.first;
            value.forEach(
              (element) {
                selectedList.add(false);
              },
            );
            selectedList[0] = true;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    DisciplineStore store = context.watch<DisciplineStore>();
    // context.watch<DisciplineStore>();

    return Column(
      children: [
        if (selectedDiscipline.shortName!.isNotEmpty)
          Card(
            elevation: 15,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: MyColors().gradientHomePageTitle(),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: SizedBox(
                    height: heigth * .06,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 8,
                          child: SizedBox(
                            child: ListView.builder(
                              itemCount: list.length,
                              padding: EdgeInsets.only(left: 15),
                              shrinkWrap: true,
                              itemExtent: 90,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    selectedList.clear();
                                    list.forEach(
                                        (element) => selectedList.add(false));
                                    selectedList[index] = true;
                                    selectedDiscipline = list[index];
                                    print('${selectedDiscipline.longName}');
                                    setState(() {});
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      selectedDiscipline = list[index];
                                      showDisciplineOptions =
                                          !showDisciplineOptions;
                                    });
                                  },
                                  child: Card(
                                      color: selectedList[index]
                                          ? MyColors().paletteColor3
                                          : MyColors().paletteColor2,
                                      child: Center(
                                          child: Text(
                                        list[index].shortName!,
                                        style: TextStyle(
                                          color: selectedList[index]
                                              ? MyColors().paletteColor2
                                              : MyColors().paletteColor3,
                                        ),
                                      ))),
                                );
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                              onPressed: () async {
                                await createDisciplineDialog(context);
                              },
                              icon: Icon(Icons.add)),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        if (showDisciplineOptions)
          ShowDisciplineOptions(
              selectedDiscipline: selectedDiscipline, store: store),
        Card(
          child: SizedBox(
              height: 50,
              child: Center(
                  child: Text(
                      'Classes Store recebe  ${selectedDiscipline.longName}'))),
        ),
      ],
    );
  }
}
