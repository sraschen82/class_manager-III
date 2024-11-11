import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/school_year_entity.dart';
import 'package:class_manager/app/interactors/stores/school_year_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> removeSchoolYearDialog({required BuildContext context}) async {
  List<SchoolYear> deletedList = [];

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

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors().dialogWidgetColor,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors().titleColor),
            borderRadius: BorderRadius.circular(12),
          ),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          title: const Center(
              child: Text(
            'EXCLUIR ANO LETIVO',
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
                      bool isSelected = false;

                      return TextButton(
                        onPressed: () async {
                          isSelected = !isSelected;
                          await Future.delayed(Duration(milliseconds: 200));
                          isSelected
                              ? deletedList.add(list[index])
                              : deletedList.removeWhere(
                                  (element) => element.year == list[index].year,
                                );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          backgroundBuilder: (context, states, child) {
                            if (isSelected) {
                              return DecoratedBox(
                                decoration: BoxDecoration(color: Colors.red),
                                child: child,
                              );
                            } else {
                              return DecoratedBox(
                                decoration:
                                    BoxDecoration(color: MyColors().titleColor),
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
                    },
                  ),
                )),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(
              // onPressed: () => validateForm(),
              onPressed: () async {
                for (SchoolYear element in deletedList) {
                  await context
                      .read<SchoolYearStore>()
                      .deleteSchoolYear(schoolYear: element);
                }
                Navigator.pop(context);
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      });
}
