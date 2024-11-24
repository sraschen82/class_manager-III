import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/stores/discipline_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> createDisciplineDialog(BuildContext context) async {
  TextEditingController longNameController = TextEditingController();
  TextEditingController shortNameController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        bool isRegularDiscipline = true;

        validateForm() async {
          if (longNameController.text.isNotEmpty &&
              shortNameController.text.isNotEmpty) {
            int year = context.read<DataBase>().user.schoolYears.first.year!;
            Discipline newDiscipline = Discipline()
              ..longName = longNameController.text
              ..shortName = shortNameController.text
              ..isRegularDiscipline = isRegularDiscipline
              ..classes = [];

            await context
                .read<DisciplineStore>()
                .saveDiscipline(year: year, newDiscipline: newDiscipline);
          }
          Navigator.pop(context);
        }

        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: MyColors().dialogWidgetColor,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors().titleColor),
              borderRadius: BorderRadius.circular(12),
            ),
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            title: const Center(
                child: Text(
              'CRIAR DISCILPINA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
            content: SizedBox(
              height: 300,
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        cursorColor: MyColors().titleColor,
                        cursorRadius: const Radius.circular(15),
                        cursorHeight: 18,
                        showCursor: true,
                        controller: longNameController,
                        style: TextStyle(color: MyColors().titleColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Nome completo',
                            // hintText: 'Nome completo',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors().titleColor,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors().titleColor,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors().titleColor,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            fillColor: MyColors().titleColor,
                            floatingLabelStyle: TextStyle(
                              color: MyColors().titleColor,
                            )),
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                      ),
                      TextField(
                        maxLength: 3,
                        cursorColor: MyColors().titleColor,
                        cursorRadius: const Radius.circular(15),
                        cursorHeight: 18,
                        showCursor: true,
                        controller: shortNameController,
                        style: TextStyle(color: MyColors().titleColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Sigla ',
                            // hintText: 'Nome completo',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors().titleColor,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors().titleColor,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors().titleColor,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            fillColor: MyColors().titleColor,
                            floatingLabelStyle: TextStyle(
                              color: MyColors().titleColor,
                            )),
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                print('sdcsdc - $isRegularDiscipline');
                                isRegularDiscipline = !isRegularDiscipline;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: isRegularDiscipline
                                          ? Colors.blue
                                          : Colors.white),
                                  child: SizedBox(
                                      height: isRegularDiscipline ? 30 : 15,
                                      width: isRegularDiscipline ? 30 : 15,
                                      child: isRegularDiscipline
                                          ? Icon(Icons.check)
                                          : SizedBox.shrink()),
                                ),
                                Text(
                                  'Disciplina\nRegular',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: isRegularDiscipline ? 17 : 12),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isRegularDiscipline = !isRegularDiscipline;
                              });
                            },
                            child: Column(
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: !isRegularDiscipline
                                          ? Colors.blue
                                          : Colors.white),
                                  child: SizedBox(
                                      height: !isRegularDiscipline ? 30 : 15,
                                      width: !isRegularDiscipline ? 30 : 15,
                                      child: !isRegularDiscipline
                                          ? Icon(Icons.check)
                                          : SizedBox.shrink()),
                                ),
                                Text(
                                  'Disciplina\nEletiva',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: !isRegularDiscipline ? 17 : 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar')),
              TextButton(
                onPressed: () async {
                  validateForm();
                },
                child: const Text(
                  'Salvar',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () async {
                  validateForm();
                  // ir para criação de turma
                },
                child: const Text(
                  'Salvar e \ncriar turma',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        });
      });
}
