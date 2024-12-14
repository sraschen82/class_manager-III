import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/dialogs/add_students_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/student_widget.dart';
import 'package:flutter/material.dart';

class WrapperStudent extends StatefulWidget {
  final SchoolClass schoolClass;
  final Discipline discipline;
  const WrapperStudent(
      {super.key, required this.schoolClass, required this.discipline});

  @override
  State<WrapperStudent> createState() => _WrapperStudentState();
}

class _WrapperStudentState extends State<WrapperStudent> {
  late bool expandAllWidgets;
  @override
  void initState() {
    super.initState();
    expandAllWidgets = false;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    List<Student> list = [];

    late Widget child;

    widget.schoolClass.students != null && widget.schoolClass.students!.isEmpty
        ? child = Center(
            child: SizedBox(
              height: 120,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: InkWell(
                      onTap: () async {
                        await addStudentsDialog(
                            context: context,
                            schoolClass: widget.schoolClass,
                            discipline: widget.discipline);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.group_add_sharp),
                          Text('Inserir alunos'),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          )
        : {
            list.addAll(widget.schoolClass.students!),
            list.sort(
              (a, b) => a.name.compareTo(b.name),
            ),
            child = Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          expandAllWidgets = !expandAllWidgets;
                          setState(() {});
                        },
                        iconSize: 18,
                        icon: expandAllWidgets
                            ? Icon(Icons.expand_less)
                            : Icon(Icons.expand)),
                  ),
                  ListView.builder(
                    itemCount: list.length,
                    physics: NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StudentWidget(
                        student: list[index],
                        listNumb: index + 1,
                        expandAll: expandAllWidgets,
                        schoolClass: widget.schoolClass,
                        discipline: widget.discipline,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  )
                ],
              ),
            ),
          };

    return child;
  }
}
