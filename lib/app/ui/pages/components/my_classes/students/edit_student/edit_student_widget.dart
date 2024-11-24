import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/edit_student/edit_name_component.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/edit_student/revaluations_component.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/edit_student/top_component.dart';
import 'package:class_manager/app/ui/pages/initial_page.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class EditStudentWidget extends StatefulWidget {
  final BuildContext context;
  final Student student;
  final Discipline discipline;
  final SchoolClass schoolClass;

  const EditStudentWidget(
      {super.key,
      required this.context,
      required this.student,
      required this.discipline,
      required this.schoolClass});

  @override
  State<EditStudentWidget> createState() => _EditStudentWidgetState();
}

class _EditStudentWidgetState extends State<EditStudentWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: MyColors().gradientHomePage()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: MyColors().gradientHomePage(),
                borderRadius: BorderRadius.circular(12),
                border: Border.fromBorderSide(
                    BorderSide(color: MyColors().titleColor)),
              ),
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TopComponent(
                          student: widget.student,
                          schoolClass: widget.schoolClass),
                      EditNameComponent(
                        student: widget.student,
                        schoolClass: widget.schoolClass,
                        discipline: widget.discipline,
                      ),
                      RevaluationsComponent(
                        student: widget.student,
                        schoolClass: widget.schoolClass,
                        discipline: widget.discipline,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InitialPage(
                                          title: 'Class Manager', pageNumb: 0),
                                    ));
                              },
                              child: const Text(
                                'Voltar',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
