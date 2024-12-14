import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/pages/components/generic_confirm_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/dialogs/change_class_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/edit_student/edit_student_widget.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/student_grades_card_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentWidget extends StatefulWidget {
  final Student student;
  final int listNumb;
  final bool expandAll;
  final SchoolClass schoolClass;
  final Discipline discipline;

  const StudentWidget(
      {super.key,
      required this.student,
      required this.listNumb,
      required this.expandAll,
      required this.schoolClass,
      required this.discipline});

  @override
  State<StudentWidget> createState() => _StudentWidgetState();
}

class _StudentWidgetState extends State<StudentWidget> {
  bool showOptions = false;
  late bool showStudentInfo;

  @override
  void initState() {
    super.initState();
    showStudentInfo = widget.expandAll;
  }

  @override
  void didUpdateWidget(covariant StudentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    showStudentInfo = widget.expandAll;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      isThreeLine: true,
      onTap: () {
        setState(() {
          showStudentInfo = !showStudentInfo;
        });
      },
      onLongPress: () {
        setState(() {
          showOptions = !showOptions;
        });
      },
      title: Column(
        crossAxisAlignment: !showStudentInfo
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          showStudentInfo
              ? Text(
                  '${widget.listNumb}. ${widget.student.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, overflow: TextOverflow.fade),
                )
              : Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.listNumb}. ${widget.student.name}',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: showOptions ? 16 : 13),
                        ),
                      ],
                    ),
                    if (showOptions)
                      Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: MyColors().titleColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await changeClassDialog(
                                    context: context,
                                    student: widget.student,
                                    schoolClass: widget.schoolClass,
                                    discipline: widget.discipline);
                              },
                              icon: Icon(Icons.swap_horizontal_circle_sharp),
                            ),
                            IconButton(
                              onPressed: () {
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
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () async {
                                await confirmDialog(
                                    context: context,
                                    title: 'EXCLUIR ALUNO',
                                    text:
                                        'Deseja, realmente, excluir o aluno ${widget.student.name}',
                                    action: () async {
                                      Navigator.pop(context);
                                      await context
                                          .read<StudentStore>()
                                          .deleteStudent(
                                              student: widget.student,
                                              schoolClass: widget.schoolClass,
                                              discipline: widget.discipline);
                                    });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
          if (showStudentInfo) Divider(),
        ],
      ),
      subtitle: showStudentInfo
          ? Column(
              children: [
                StudentGradesCardWidget(
                  student: widget.student,
                  schoolClass: widget.schoolClass,
                  discipline: widget.discipline,
                ),
                Divider()
              ],
            )
          : SizedBox.shrink(),
      visualDensity: VisualDensity.compact,
    );
  }
}
