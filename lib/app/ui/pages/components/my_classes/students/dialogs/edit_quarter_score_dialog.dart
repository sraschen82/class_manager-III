import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> editQuarterScoreDialog(
    {required BuildContext context,
    required Student student,
    required int quarter,
    required Discipline discipline,
    required SchoolClass schoolClass}) async {
  TextEditingController scoreController = TextEditingController();
  double? selected;
  int? scoreIndex;
  bool showEditCard = false;

  List<double> list = [];
  switch (quarter) {
    case 1:
      list.addAll(student.firstQuarterGrades);
    case 2:
      list.addAll(student.secondQuarterGrades);
    case 3:
      list.addAll(student.thirdQuarterGrades);
    case _:
      [];
  }
  ;

  List<bool> isSelectedList = [];
  list.forEach(
    (element) => isSelectedList.add(false),
  );

  validateForm() async {
    FocusManager.instance.primaryFocus?.unfocus();

    String str = scoreController.text;
    str = str.replaceAll(r',', '.');

    double? score = double.tryParse(str);

    if (score != null && score >= 0 && score <= 10 && scoreIndex != null) {
      list.removeAt(scoreIndex!);
      list.insert(scoreIndex!, score);
      await context.read<StudentStore>().editQuarterScores(
          student: student,
          quarter: quarter,
          scores: list,
          schoolClass: schoolClass,
          discipline: discipline);
      Navigator.pop(context, true);
    } else {
      scoreController.clear();
    }
  }

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
              title: Center(
                  child: Text(
                'EDITAR AVALIAÇÕES DO $quarter TRI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
              content: SizedBox(
                height: 200,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 90,
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
                                  showEditCard = !showEditCard;
                                  scoreIndex = index;
                                  isSelectedList.clear();
                                  list.forEach(
                                    (element) => isSelectedList.add(false),
                                  );

                                  isSelectedList[index] = isSelected;

                                  await Future.delayed(
                                      Duration(milliseconds: 200));
                                  if (isSelectedList[index]) {
                                    selected = list[index];
                                  } else {
                                    selected = null;
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
                                  list[index].toString(),
                                  style: TextStyle(
                                      color: MyColors().paletteColor1),
                                ),
                              );
                            }),
                        if (showEditCard == true)
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormField(
                                    cursorColor: MyColors().titleColor,
                                    cursorRadius: const Radius.circular(15),
                                    cursorHeight: 18,
                                    textAlign: TextAlign.center,
                                    maxLength: 4,
                                    minLines: 1,
                                    maxLines: 50,
                                    onChanged: (value) =>
                                        scoreController.value =
                                            TextEditingValue(
                                                text: value.toUpperCase()),
                                    showCursor: true,
                                    controller: scoreController,
                                    style:
                                        TextStyle(color: MyColors().titleColor),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        alignLabelWithHint: true,
                                        labelText: 'Editar Nota',
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors().titleColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors().titleColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors().titleColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        fillColor: MyColors().titleColor,
                                        floatingLabelStyle: TextStyle(
                                          color: MyColors().titleColor,
                                        )),
                                    autofocus: true,
                                    onFieldSubmitted: (value) => validateForm(),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ],
                              )),
                      ],
                    ),
                  ),
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                if (selected != null)
                  TextButton(
                      onPressed: () async {
                        if (selected != null && scoreIndex != null) {
                          list.removeAt(scoreIndex!);
                          await context.read<StudentStore>().editQuarterScores(
                              student: student,
                              quarter: quarter,
                              scores: list,
                              schoolClass: schoolClass,
                              discipline: discipline);

                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Excluir')),
                TextButton(
                  onPressed: () async {
                    if (showEditCard == false && scoreController.text.isEmpty) {
                      showEditCard == true;
                      await Future.delayed(Duration(milliseconds: 200));
                      setState(
                        () {},
                      );
                    } else if (selected != null &&
                        scoreIndex != null &&
                        showEditCard == false &&
                        scoreController.text.isEmpty) {
                      list.removeAt(scoreIndex!);

                      await context.read<StudentStore>().editQuarterScores(
                          student: student,
                          quarter: quarter,
                          scores: list,
                          schoolClass: schoolClass,
                          discipline: discipline);

                      Navigator.pop(context);
                    } else {}
                  },
                  style: TextButton.styleFrom(
                      foregroundBuilder: (context, states, child) {
                    if (selected == null) {
                      return Text(
                        'Escolha uma nota',
                        style: TextStyle(color: Colors.grey),
                      );
                    } else {
                      return Text(
                        '',
                      );
                    }
                  }),
                  child: SizedBox.shrink(),
                ),
              ],
            );
          },
        );
      });
}
