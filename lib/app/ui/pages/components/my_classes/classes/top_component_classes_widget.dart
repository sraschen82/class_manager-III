import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/pages/components/generic_confirm_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/edit_classes_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/students/dialogs/add_students_dialog.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopComponentWidget extends StatefulWidget {
  const TopComponentWidget({
    super.key,
    required this.schoolClass,
    required this.discipline,
  });

  final SchoolClass schoolClass;
  final Discipline discipline;

  @override
  State<TopComponentWidget> createState() => _TopComponentWidgetState();
}

class _TopComponentWidgetState extends State<TopComponentWidget> {
  bool showClassOptions = false;

  @override
  Widget build(BuildContext context) {
    SchoolClassStore store = context.watch<SchoolClassStore>();
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: showClassOptions
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: InkWell(
              onTap: () {
                setState(() {
                  showClassOptions = !showClassOptions;
                });
              },
              child: Card(
                elevation: 15,
                shadowColor: MyColors().paletteColor3,
                color: MyColors().titleColor,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 8, 45, 8),
                  child: Text(
                    '${widget.schoolClass.name}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: MyColors().paletteColor3),
                  ),
                ),
              ),
            ),
          ),
          if (showClassOptions)
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      await addStudentsDialog(
                          context: context,
                          schoolClass: widget.schoolClass,
                          discipline: widget.discipline);
                    },
                    icon: Icon(Icons.group_add_rounded),
                  ),
                  IconButton(
                    onPressed: () async {
                      await editClassDialog(
                          context: context,
                          editedClass: widget.schoolClass,
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
                              'Deseja, realmente, excluir a turma ${widget.schoolClass.name}?\nTodos os alunos inseridos nesta turma serão removidos também.',
                          action: () async {
                            Navigator.pop(context);
                            await store.deleteClass(
                                newClass: widget.schoolClass,
                                discipline: widget.discipline);
                          });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
