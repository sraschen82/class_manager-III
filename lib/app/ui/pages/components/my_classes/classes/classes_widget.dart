import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/top_component_classes_widget.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/wrapper_student.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassesWidget extends StatefulWidget {
  final Discipline discipline;
  const ClassesWidget({super.key, required this.discipline});

  @override
  State<ClassesWidget> createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {
  List<SchoolClass> list = [];

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    context.watch<SchoolClassStore>();
    list.clear();
    list.addAll(widget.discipline.classes!);
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 2),
      child: Container(
        height: heigth * .61,
        width: width,
        child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          physics: PageScrollPhysics(),
          
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  gradient: MyColors().gradientStudentCard(),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.fromBorderSide(
                      BorderSide(color: MyColors().titleColor))),
              child: SizedBox(
                height: heigth * .6,
                width: width * .98,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TopComponentWidget(
                        schoolClass: list[index],
                        discipline: widget.discipline,
                      ),
                      WrapperStudent(
                        schoolClass: list[index],
                        discipline: widget.discipline,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
