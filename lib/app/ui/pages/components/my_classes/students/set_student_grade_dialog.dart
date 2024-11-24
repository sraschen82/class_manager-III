import 'dart:async';

import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> setStudentGradeDialog(
    {required BuildContext context,
    required Student student,
    required SchoolClass schoolClass,
    required Discipline discipline,
    required int index,
    required bool isGrade}) async {
      
  setGrade(double? grade) async {
    Student editedStudent = student;
    if (grade == null) {
      if (index == 1) {
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
      } else if (index == 2) {
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
      if (index == 1) {
        isGrade
            ? {
                editedStudent.finalGrade1 = grade,
              }
            : {
                editedStudent.revaluationGrade1 = grade,
              };
      } else if (index == 2) {
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
    Navigator.pop(context);
    await context.read<SchoolClassStore>().editStudent(
        editedStudent: editedStudent,
        oldStudent: student,
        schoolClass: schoolClass,
        discipline: discipline);
  }

  return showDialog(
      context: context,
      builder: (context) {
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
                  ? Text(
                      '${student.name}\n${schoolClass.name} - ${index} TRI',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    )
                  : Text(
                      '${student.name}\n${schoolClass.name} - Reavaliação ${index} TRI',
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
                    color:
                        const Color.fromARGB(255, 148, 16, 16).withOpacity(.1),
                  ),
                  child: GridView.builder(
                    itemCount: 21,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 2,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, indexGV) {
                      return SizedBox(
                        height: 8,
                        width: 12,
                        child: Card(
                          color: indexGV > 8
                              ? const Color.fromARGB(255, 226, 30, 16)
                              : const Color.fromARGB(255, 10, 82, 207),
                          elevation: 15,
                          child: TextButton(
                              onPressed: () {
                                setGrade(10 - indexGV.toDouble() * 0.5);
                              },
                              child: Text(
                                '${10 - indexGV.toDouble() * 0.5}',
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
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
            TextButton(
              onPressed: () {
                setGrade(null);
              },
              child: const Text('Em branco'),
            ),
          ],
        );
      });
}
