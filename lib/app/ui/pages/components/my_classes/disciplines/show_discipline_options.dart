import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/stores/discipline_store.dart';
import 'package:class_manager/app/ui/extentions/text_ext.dart';
import 'package:class_manager/app/ui/pages/components/generic_confirm_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/create_class_dialog.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/edit_discipline_dialog.dart';
import 'package:class_manager/app/ui/pages/initial_page.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class ShowDisciplineOptions extends StatelessWidget {
  const ShowDisciplineOptions({
    super.key,
    required this.selectedDiscipline,
    required this.store,
  });

  final Discipline selectedDiscipline;
  final DisciplineStore store;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors().dialogWidgetColor,
      elevation: 15,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColors().titleColor)),
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: MyColors().gradientHomePageTitle()),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: SizedBox(
              height: 90,
              child: Center(
                  child: Column(
                children: [
                  Text(' ${selectedDiscipline.longName}')
                      .removeNullAndEditSize(22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(EdgeInsets.all(20))),
                          onPressed: () async {
                            await editDisciplineDialog(
                                context: context,
                                discipline: selectedDiscipline);
                          },
                          child: Text('Editar')),
                      TextButton(
                          onPressed: () async {
                            await createClassDialog(
                                context: context,
                                discipline: selectedDiscipline);
                          },
                          child: Text('Adicionar Turma')),
                      TextButton(
                          onPressed: () async {
                            await confirmDialog(
                                context: context,
                                title: 'EXCLUIR DISCIPLINA',
                                text:
                                    'Deseja realmente excluir a disciplina ${selectedDiscipline.longName}?',
                                action: () async {
                                  Navigator.pop(context);
                                  await store.deleteDiscipline(
                                      discipline: selectedDiscipline);
                                });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InitialPage(
                                      title: 'Class Manager', pageNumb: 0),
                                ));
                          },
                          child: Text('Excluir')),
                    ],
                  )
                ],
              ))),
        ),
      ),
    );
  }
}
