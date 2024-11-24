import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/extentions/student_ext.dart';
import 'package:class_manager/app/ui/extentions/text_ext.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/set_student_grade_dialog.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RevaluationsComponent extends StatefulWidget {
  final Student student;

  final Discipline discipline;

  final SchoolClass schoolClass;

  const RevaluationsComponent(
      {super.key,
      required this.student,
      required this.discipline,
      required this.schoolClass});

  @override
  State<RevaluationsComponent> createState() => _RevaluationsComponentState();
}

class _RevaluationsComponentState extends State<RevaluationsComponent> {
  TextEditingController finalRevaluationController = TextEditingController();
  TextEditingValue finalRevaluationValue = TextEditingValue();
  @override
  Widget build(BuildContext context) {
    Widget gradesWidget({required int index, required bool isGrade}) {
      return TextButton(
        onPressed: () async {
          await setStudentGradeDialog(
              context: context,
              student: widget.student,
              schoolClass: widget.schoolClass,
              discipline: widget.discipline,
              index: index,
              isGrade: isGrade);
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          backgroundBuilder: (context, states, child) {
            return DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: MyColors().titleColor),
                    color: isGrade
                        ? switch (index) {
                            1 => widget.student.isInFirstQuarterRevaluation()
                                ? MyColors().paletteColor3
                                : MyColors().gradesIcon,
                            2 => widget.student.isInSecondQuarterRevaluation()
                                ? MyColors().paletteColor3
                                : MyColors().gradesIcon,
                            3 => widget.student.isInThirthQuarterRevaluation()
                                ? MyColors().paletteColor3
                                : MyColors().gradesIcon,
                            _ => null
                          }
                        : switch (index) {
                            1 => widget.student.haveFinalRevaluationInQuarter(1)
                                ? MyColors().paletteColor3
                                : MyColors().gradesIcon,
                            2 => widget.student.haveFinalRevaluationInQuarter(2)
                                ? MyColors().paletteColor3
                                : MyColors().gradesIcon,
                            3 => widget.student.haveFinalRevaluationInQuarter(3)
                                ? MyColors().paletteColor3
                                : MyColors().gradesIcon,
                            _ => null
                          }),
                child: switch (isGrade) {
                  true => switch (index) {
                      1 => widget.student.finalGrade1 != null
                          ? Center(
                              child: Text('${widget.student.finalGrade1}'),
                            )
                          : Center(
                              child: Text(
                                '$indexºTRI',
                              ),
                            ),
                      2 => widget.student.finalGrade2 != null
                          ? Center(
                              child: Text('${widget.student.finalGrade2}'),
                            )
                          : Center(
                              child: Text(
                                '$indexºTRI',
                              ),
                            ),
                      3 => widget.student.finalGrade3 != null
                          ? Center(
                              child: Text('${widget.student.finalGrade3}'),
                            )
                          : Center(
                              child: Text(
                                '$indexºTRI',
                              ),
                            ),
                      _ => SizedBox.shrink(),
                    },
                  false => switch (index) {
                      1 => widget.student.revaluationGrade1 != null
                          ? Center(
                              child:
                                  Text('${widget.student.revaluationGrade1}'),
                            )
                          : Center(
                              child: Text(
                                '$indexºTRI',
                              ),
                            ),
                      2 => widget.student.revaluationGrade2 != null
                          ? Center(
                              child:
                                  Text('${widget.student.revaluationGrade2}'),
                            )
                          : Center(
                              child: Text(
                                '$indexºTRI',
                              ),
                            ),
                      3 => widget.student.finalGrade3 != null
                          ? Center(
                              child: Text('${widget.student.finalGrade3}'),
                            )
                          : Center(
                              child: Text(
                                '$indexºTRI',
                              ),
                            ),
                      _ => SizedBox.shrink(),
                    }
                });
          },
        ),
        child: SizedBox.shrink(),
      );
    }

    validateFinalGrade() async {
      Student editedStudent = widget.student;
      String stringValue = '';
      if (finalRevaluationController.text.isNotEmpty) {
        stringValue = finalRevaluationController.text.replaceAll(',', '.');
        print('${finalRevaluationController.text}');
        double grade = double.parse(stringValue);
        if (grade <= 10 && grade >= 0) {
          editedStudent.finalRevaluationGrade = grade;
          finalRevaluationController.clear();
          setState(() {});
          await context.read<SchoolClassStore>().editStudent(
              editedStudent: editedStudent,
              oldStudent: widget.student,
              schoolClass: widget.schoolClass,
              discipline: widget.discipline);
        }
      }
    }

    return Column(
      children: [
        Card(
          elevation: 5,
          color: MyColors().paletteColor3,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.black,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: MyColors().titleColor)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        child: Text('Notas do Trimestre',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          gradesWidget(index: 1, isGrade: true),
                          gradesWidget(index: 2, isGrade: true),
                          gradesWidget(index: 3, isGrade: true),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        if (widget.student.haveAnyRevaluation())
          Card(
            elevation: 5,
            color: MyColors().paletteColor3,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.black,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: MyColors().titleColor)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: Text('Reavaliações',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (widget.student.isInFirstQuarterRevaluation())
                              Column(
                                children: [
                                  if (widget.student.revaluationGrade1 != null)
                                    Text('1º TRI').removeNullAndEditSize(12),
                                  gradesWidget(index: 1, isGrade: false),
                                ],
                              ),
                            if (widget.student.isInSecondQuarterRevaluation())
                              Column(
                                children: [
                                  if (widget.student.revaluationGrade2 != null)
                                    Text('2º TRI').removeNullAndEditSize(12),
                                  gradesWidget(index: 2, isGrade: false),
                                ],
                              ),
                            if (widget.student.isInThirthQuarterRevaluation())
                              Column(
                                children: [
                                  Text('3º TRI'),
                                  gradesWidget(index: 3, isGrade: false),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        if (widget.student.isInFinalRevaluation())
          Card(
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
                children: [
                  const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                      child: Text('Reavaliação Final',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        widget.student.quarterGradesReportWidget(1),
                        widget.student.quarterGradesReportWidget(2),
                        widget.student.quarterGradesReportWidget(3),
                        if (widget.student.finalRevaluationGrade != null)
                          Card(
                            elevation: 15,
                            surfaceTintColor: Colors.black,
                            shape: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(strokeAlign: 2),
                            ),
                            color: widget.student.finalRevaluationGrade! < 6
                                ? Colors.amber
                                : Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Text('Final'),
                                  Text(
                                      '${widget.student.finalRevaluationGrade}'),
                                ],
                              ),
                            ),
                          )
                      ]),
                  const Divider(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 120,
                      child: TextFormField(
                        autofocus: false,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        maxLength: 3,
                        showCursor: true,
                        controller: finalRevaluationController,
                        cursorColor: Colors.white,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        onEditingComplete: () => validateFinalGrade(),
                        onSaved: (value) {
                          validateFinalGrade();
                        },
                        onFieldSubmitted: (value) {
                          validateFinalGrade();
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: Color.fromARGB(255, 233, 219, 219),
                            color: Colors.white,
                            wordSpacing: 2),
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelText: 'Final Grade',
                            hintText: '${widget.student.finalRevaluationGrade}',
                            fillColor: Colors.white,
                            counterStyle: TextStyle(color: Colors.white),
                            floatingLabelStyle: TextStyle(color: Colors.white),
                            contentPadding: EdgeInsets.all(5),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.white,
                              ),
                              gapPadding: 4,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
