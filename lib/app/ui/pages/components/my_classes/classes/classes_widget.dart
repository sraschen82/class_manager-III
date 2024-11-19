import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/pages/components/generic_confirm_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/edit_classes_dialog.dart';
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

    SchoolClassStore store = context.watch<SchoolClassStore>();
    list.clear();
    list.addAll(widget.discipline.classes!);
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: MyColors().gradientHomePageTitle(),
            borderRadius: BorderRadius.circular(12),
            border: Border.fromBorderSide(
                BorderSide(color: MyColors().titleColor))),
        child: SizedBox(
          // height: heigth,
          // width: width,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                SizedBox(
                  height: heigth * .62,
                  child: ListView.builder(
                    itemCount: list.length,
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Card(
                                  elevation: 15,
                                  shadowColor: MyColors().paletteColor3,
                                  color: MyColors().titleColor,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(45, 8, 45, 8),
                                    child: Text(
                                      '${list[index].name}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: MyColors().paletteColor3),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: () async {},
                                      icon: Icon(Icons.group_add_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await editClassDialog(
                                            context: context,
                                            editedClass: list[index],
                                            discipline: widget.discipline);
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await confirmDialog(
                                            context: context,
                                            title: 'EXCLUIR TURMA',
                                            text:
                                                'Deseja, realmente, excluir a turma ${list[index].name}?\nTodos os alunos inseridos nesta turma serão removidos também.',
                                            action: () async {
                                              Navigator.pop(context);
                                              await store.deleteClass(
                                                  newClass: list[index],
                                                  discipline:
                                                      widget.discipline);
                                            });
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: MyColors().gradientHomePageTitle(),
                                  borderRadius: BorderRadius.circular(1),
                                  border: Border.fromBorderSide(BorderSide(
                                      color: MyColors().titleColor))),
                              child: SizedBox(
                                height: heigth * .4,
                                width: width,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
