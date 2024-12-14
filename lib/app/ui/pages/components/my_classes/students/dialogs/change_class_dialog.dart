import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> changeClassDialog(
    {required BuildContext context,
    required Student student,
    required Discipline discipline,
    required SchoolClass schoolClass}) async {
  SchoolClass selected = SchoolClass();

  List<SchoolClass> list = [];
  await context
      .read<SchoolClassStore>()
      .getClasses(discipline: discipline)
      .then(
    (value) {
      list.addAll(value);

      if (list.length > 1) {
        list.sort(
          (a, b) => a.name!.compareTo(b.name!),
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
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: MyColors().dialogWidgetColor,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors().titleColor),
              borderRadius: BorderRadius.circular(12),
            ),
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            title: Center(
                child: Column(
              children: [
                Text(
                  'ALTERAR TURMA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text('${discipline.longName} '),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '${student.name}\n${schoolClass.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: MyColors().gold),
                  ),
                )
              ],
            )),
            content: SizedBox(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 80,
                        childAspectRatio: 3 / 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
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
                              selected = SchoolClass()
                                ..name = ''
                                ..students = [];
                            }

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
                                  decoration: BoxDecoration(color: Colors.red),
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
                            list[index].name.toString(),
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
                  if (selected.name != '') {
                    await context.read<StudentStore>().changeStudentClass(
                        student: student,
                        newClass: selected,
                        oldClass: schoolClass,
                        discipline: discipline);

                    Navigator.pop(context);
                  }
                },
                style: TextButton.styleFrom(
                  foregroundBuilder: (context, states, child) {
                    if (selected.name == '') {
                      return Text(
                        'Escolha uma turma',
                        style: TextStyle(color: Colors.grey),
                      );
                    } else {
                      return Text(
                        'Salvar',
                      );
                    }
                  },
                ),
                child: SizedBox.shrink(),
              ),
            ],
          );
        });
      });
}
