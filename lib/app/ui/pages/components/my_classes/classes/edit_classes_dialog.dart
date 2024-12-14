import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/dialogs/add_quarter_score_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/dialogs/set_student_grade_dialog.dart';
import 'package:class_manager/app/ui/ui_elements/app_buttons.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> editClassDialog(
    {required BuildContext context,
    required SchoolClass editedClass,
    required Discipline discipline}) async {
  bool clearStudents = false;

  TextEditingController nameController =
      TextEditingController(text: editedClass.name);

  return showDialog(
      context: context,
      builder: (context) {
        List<Student> list = editedClass.students!;
        list.sort(
          (a, b) => a.name.compareTo(b.name),
        );

        validateForm() async {
          if (nameController.text.isNotEmpty) {
            SchoolClass newClass = SchoolClass()
              ..name = nameController.text
              ..students = clearStudents ? [] : editedClass.students;

            await context.read<SchoolClassStore>().editClass(
                newClass: newClass,
                oldClass: editedClass,
                discipline: discipline);
          }
          Navigator.pop(context);
        }

        Future<void> setClassGrades(int querterNumb) async {
          for (Student student in editedClass.students!) {
            bool isDone = await showDialog(
              context: context,
              builder: (context) => SetStudentGradeDialog(
                context: context,
                student: student,
                schoolClass: editedClass,
                discipline: discipline,
                isGrade: true,
                quarterNumb: querterNumb,
                onCancel: () async {
                  Navigator.of(context).pop();
                },
              ),
            );
            if (isDone) {
              continue;
            }
          }
        }

        Future<void> setQuarterScores(int querterNumb) async {
          for (Student student in editedClass.students!) {
            bool isDone = await showDialog(
              context: context,
              builder: (context) => AddQuarterScoreDialog(
                student: student,
                schoolClass: editedClass,
                discipline: discipline,
                quarterNumb: querterNumb,
              ),
            );
            if (isDone) {
              continue;
            }
          }
        }

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
                  'EDITAR TURMA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text('${discipline.longName}')
              ],
            )),
            content: SizedBox(
              height: 400,
              width: 250,
              child: Card(
                elevation: 5,
                color: MyColors().paletteColor3,
                shadowColor: Colors.white,
                surfaceTintColor: Colors.black,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: MyColors().titleColor)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                          maxLength: 20,
                          cursorColor: MyColors().titleColor,
                          cursorRadius: const Radius.circular(15),
                          cursorHeight: 18,
                          showCursor: true,
                          controller: nameController,
                          style: TextStyle(color: MyColors().titleColor),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Editar Nome',
                              hintText: editedClass.name,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors().titleColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors().titleColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors().titleColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              fillColor: MyColors().titleColor,
                              floatingLabelStyle: TextStyle(
                                color: MyColors().titleColor,
                              )),
                          textInputAction: TextInputAction.next,
                        ),
                        Card(
                          elevation: 5,
                          color: MyColors().paletteColor3,
                          shadowColor: Colors.white,
                          surfaceTintColor: Colors.black,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: MyColors().titleColor)),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                    child: Text('Lançar Avaliação',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppButtons.gradientButton(
                                            text: '1º TRI',
                                            action: () async {
                                              await setQuarterScores(1);
                                            }),
                                        AppButtons.gradientButton(
                                            text: '2º TRI',
                                            action: () async {
                                              await setQuarterScores(2);
                                            }),
                                        AppButtons.gradientButton(
                                            text: '3º TRI',
                                            action: () async {
                                              await setQuarterScores(3);
                                            }),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          color: MyColors().paletteColor3,
                          shadowColor: Colors.white,
                          surfaceTintColor: Colors.black,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: MyColors().titleColor)),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                    child: Text('Lançar Notas do Boletim',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AppButtons.gradientButton(
                                            text: '1º TRI',
                                            action: () async {
                                              await setClassGrades(1);
                                            }),
                                        AppButtons.gradientButton(
                                            text: '2º TRI',
                                            action: () async {
                                              await setClassGrades(2);
                                            }),
                                        AppButtons.gradientButton(
                                            text: '3º TRI',
                                            action: () async {
                                              await setClassGrades(3);
                                            }),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              TextButton(
                onPressed: () async {
                  validateForm();
                },
                child: const Text(
                  'Salvar',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () async {
                  clearStudents = true;
                  validateForm();
                  // ir para adicionar alunos
                },
                child: const Text(
                  'Exluir todos\nAlunos',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        });
      });
}
