import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/extentions/student_ext.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetStudentGradeDialog extends StatelessWidget {
  final BuildContext context;
  final Student student;
  final SchoolClass schoolClass;
  final Discipline discipline;
  final int quarterNumb;
  final bool isGrade;
  final Function onCancel;

  const SetStudentGradeDialog(
      {super.key,
      required this.context,
      required this.student,
      required this.schoolClass,
      required this.discipline,
      required this.quarterNumb,
      required this.isGrade,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    setGrade(double? grade) async {
      Student editedStudent = student;
      if (grade == null) {
        if (quarterNumb == 1) {
          isGrade
              ? {
                  editedStudent.finalGrade1 = grade,
                  editedStudent.revaluationGrade1 = grade,
                  editedStudent.finalRevaluationGrade = grade,
                }
              : {
                  editedStudent.revaluationGrade1 = grade,
                  editedStudent.finalRevaluationGrade = grade,
                };
        } else if (quarterNumb == 2) {
          isGrade
              ? {
                  editedStudent.finalGrade2 = grade,
                  editedStudent.revaluationGrade2 = grade,
                  editedStudent.finalRevaluationGrade = grade,
                }
              : {
                  editedStudent.revaluationGrade2 = grade,
                  editedStudent.finalRevaluationGrade = grade,
                };
        } else {
          editedStudent.finalGrade3 = grade;
        }
      } else {
        if (quarterNumb == 1) {
          isGrade
              ? {
                  editedStudent.finalGrade1 = grade,
                }
              : {
                  editedStudent.revaluationGrade1 = grade,
                };
        } else if (quarterNumb == 2) {
          isGrade
              ? {
                  editedStudent.finalGrade2 = grade,
                }
              : {
                  editedStudent.revaluationGrade2 = grade,
                };
        } else {
          editedStudent.finalGrade3 = grade;
        }
      }

      await context.read<StudentStore>().editStudent(
          editedStudent: editedStudent,
          oldStudent: student,
          schoolClass: schoolClass,
          discipline: discipline);
      Navigator.pop(context, true);
    }

    return AlertDialog(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColors().titleColor)),
      backgroundColor: MyColors().dialogWidgetColor,
      title: Center(
          child: Column(
        children: [
          Text(
            'SELECIONE UMA NOTA',
            style: TextStyle(fontSize: 22),
          ),
          Divider(),
          isGrade
              ? Column(
                  children: [
                    Text(
                      '${student.name}\n${schoolClass.name} - ${quarterNumb} TRI',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Soma das avaliações: ${student.quarterScoreSum(quarterNumb).toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )
              : Text(
                  '${student.name}\n${schoolClass.name} - Reavaliação ${quarterNumb} TRI',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                )
        ],
      )),
      content: SingleChildScrollView(
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: MyColors().titleColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 380,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 148, 16, 16).withOpacity(.1),
              ),
              child: GridView.builder(
                itemCount: 21,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 2,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, quarterNumbGV) {
                  return SizedBox(
                    height: 8,
                    width: 12,
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              width: isGrade &&
                                      (10 - quarterNumbGV.toDouble() * 0.5) ==
                                          student.quarterGradeSuggestion(
                                              quarterNumb)
                                  ? 4
                                  : 2,
                              color: isGrade &&
                                      (10 - quarterNumbGV.toDouble() * 0.5) ==
                                          student.quarterGradeSuggestion(
                                              quarterNumb)
                                  ? MyColors().gold
                                  : Colors.black)),
                      color: quarterNumbGV > 8
                          ? const Color.fromARGB(255, 226, 30, 16)
                          : const Color.fromARGB(255, 10, 82, 207),
                      elevation: 15,
                      child: TextButton(
                          onPressed: () async {
                            await setGrade(10 - quarterNumbGV.toDouble() * 0.5);
                          },
                          child: Text(
                            '${10 - quarterNumbGV.toDouble() * 0.5}',
                            style: const TextStyle(fontSize: 12),
                          )),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
            onPressed: () {
              onCancel;
              Navigator.pop(context);
            },
            child: const Text('Cancelar')),
        TextButton(
          onPressed: () {
            setGrade(null);
          },
          child: const Text('Em branco'),
        ),
      ],
    );
  }
}
