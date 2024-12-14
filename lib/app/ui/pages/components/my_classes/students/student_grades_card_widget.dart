import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/ui/extentions/student_ext.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/edit_student/edit_student_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class StudentGradesCardWidget extends StatefulWidget {
  final Student student;
  final Discipline discipline;
  final SchoolClass schoolClass;
  const StudentGradesCardWidget(
      {super.key,
      required this.student,
      required this.discipline,
      required this.schoolClass});

  @override
  State<StudentGradesCardWidget> createState() =>
      _StudentGradesCardWidgetState();
}

class _StudentGradesCardWidgetState extends State<StudentGradesCardWidget> {
  bool showQuerterGrades = false;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColors().titleColor),
          gradient: MyColors().gradientStudentCard()),
      child: InkWell(
        onLongPress: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EditStudentWidget(
                    context: context,
                    student: widget.student,
                    discipline: widget.discipline,
                    schoolClass: widget.schoolClass),
              ));
        },
        child: Column(
          children: [
            Row(
              children: [
                widget.student.quarterGradesReportColumnWidget(1),
                widget.student.quarterGradesReportColumnWidget(2),
                widget.student.quarterGradesReportColumnWidget(3),
                if (widget.student.isInFinalRevaluation())
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                    child: widget.student.finalRevaluationGradeWidget(),
                  ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    showQuerterGrades = !showQuerterGrades;
                  });
                },
                icon: showQuerterGrades
                    ? Icon(Icons.arrow_drop_up)
                    : Icon(Icons.arrow_drop_down)),
            if (showQuerterGrades)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notas das avaliações do trimestre'),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('1º TRI:        '),
                        ),
                        Flexible(
                          flex: 1,
                          child:
                              Text('${widget.student.quarterScoresWidget(1)}'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('2º TRI:        '),
                        ),
                        Flexible(
                          flex: 1,
                          child:
                              Text('${widget.student.quarterScoresWidget(2)}'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('3º TRI:        '),
                        ),
                        Flexible(
                          flex: 1,
                          child:
                              Text('${widget.student.quarterScoresWidget(3)}'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
