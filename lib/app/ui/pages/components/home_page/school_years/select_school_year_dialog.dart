import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/school_year_entity.dart';
import 'package:class_manager/app/interactors/stores/school_year_store.dart';

import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> selectSchoolYearDialog({required BuildContext context}) async {
  SchoolYear selected = SchoolYear()
    ..year = 0
    ..disicplines = [];

  List<SchoolYear> list = [];
  await context.read<DataBase>().fetchUser().then(
    (value) {
      list.addAll(value.schoolYears);

      if (list.length > 1) {
        list.sort(
          (a, b) => a.year!.compareTo(b.year as num),
        );
      }
    },
  );

  List<bool> isSelectedList = [];
  list.forEach(
    (element) => isSelectedList.add(false),
  );

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: MyColors().dialogWidgetColor,
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors().titleColor),
                borderRadius: BorderRadius.circular(12),
              ),
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              title: const Center(
                  child: Text(
                'SELECIONAR ANO LETIVO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )),
              content: SizedBox(
                height: 200,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 3 / 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        addAutomaticKeepAlives: true,
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          bool isSelected = isSelectedList[index];
                          return TextButton(
                            onPressed: () async {
                              isSelected = !isSelected;

                              isSelectedList.clear();
                              list.forEach(
                                (element) => isSelectedList.add(false),
                              );

                              isSelectedList[index] = isSelected;

                              await Future.delayed(Duration(milliseconds: 200));
                              if (isSelectedList[index]) {
                                selected = list[index];
                              } else {
                                selected = SchoolYear()
                                  ..year = 0
                                  ..disicplines = [];
                              }

                              print(isSelectedList);
                              print(selected.year);
                              setState(
                                () {},
                              );
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              backgroundBuilder: (context, states, child) {
                                if (isSelectedList[index]) {
                                  return DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                    child: child,
                                  );
                                } else {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: MyColors().titleColor),
                                    child: child,
                                  );
                                }
                              },
                            ),
                            child: Text(
                              list[index].year.toString(),
                              style: TextStyle(color: MyColors().paletteColor1),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                TextButton(
                  onPressed: () async {
                    if (selected.year != 0) {
                      print('selecionado');
                      await context
                          .read<SchoolYearStore>()
                          .selectSchoolYear(schoolYear: selected);

                      Navigator.pop(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundBuilder: (context, states, child) {
                      if (selected.year == 0) {
                        return Text(
                          'Escolha um ano letivo',
                          style: TextStyle(color: Colors.grey),
                        );
                      } else {
                        return Text(
                          'Selecionar',
                        );
                      }
                    },
                  ),
                  child: SizedBox.shrink(),
                ),
              ],
            );
          },
        );
      });
}
