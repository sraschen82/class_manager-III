import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/discipline_store.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyClassesResume extends StatefulWidget {
  const MyClassesResume({super.key});

  @override
  State<MyClassesResume> createState() => _MyClassesResumeState();
}

class _MyClassesResumeState extends State<MyClassesResume> {
  List<Discipline> list = [];
  List<List<SchoolClass>> classes = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int year = context.read<DataBase>().user.schoolYears.first.year!;

      await context.read<DisciplineStore>().getAllDiscilpine(year: year).then(
        (value) {
          list.addAll(value);
          value.forEach(
            (element) {
              if (element.classes != null) {
                classes.add(element.classes!);
              } else {
                classes.add([]);
              }
            },
          );
        },
      );

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    context.watch<SchoolClassStore>();

    List<Widget> classesInfo(int index) {
      return List.generate(
        classes[index].length,
        (indexG) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 3, 3, 3),
            child: SizedBox(
              width: width * .5,
              child: classes[index][indexG].name!.length > 3
                  ? Text(
                      '- ${classes[index][indexG].name!.substring(0, 3)}:  (${classes[index][indexG].students!.length})')
                  : Text(
                      '- ${classes[index][indexG].name}:  (${classes[index][indexG].students!.length})'),
            ),
          );
        },
      );
    }

    return SizedBox(
      height: height * .28,
      width: width,
      child: list.length == 0
          ? SizedBox(
              height: 30,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('    Nenhuma disciplina adicionada.'),
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: list.length,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Center(
                    child: Column(
                  children: [
                    Card(
                        color: Colors.red[900],
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: MyColors().titleColor)),
                        child: SizedBox(
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child:
                                Center(child: Text('${list[index].shortName}')),
                          ),
                        )),
                    Column(
                      children: classesInfo(index),
                    )
                  ],
                ));
              },
            ),
    );
  }
}
