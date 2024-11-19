import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> createClassDialog(
    {required BuildContext context, required Discipline discipline}) async {
  TextEditingController nameController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        validateForm() async {
          if (nameController.text.isNotEmpty) {
            SchoolClass newClass = SchoolClass()
              ..name = nameController.text
              ..students = [];

            await context
                .read<SchoolClassStore>()
                .addClass(newClass: newClass, discipline: discipline);
          }
          Navigator.pop(context);
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) =>
          //           InitialPage(title: 'Class Manager', pageNumb: 0),
          //     ));
        }

        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: MyColors().dialogWidgetColor,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors().titleColor),
              borderRadius: BorderRadius.circular(12),
            ),
            titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            title: Center(
                child: Column(
              children: [
                Text(
                  'CRIAR TURMA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text('${discipline.longName}')
              ],
            )),
            content: SizedBox(
              height: 100,
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        maxLength: 20,
                        cursorColor: MyColors().titleColor,
                        cursorRadius: const Radius.circular(15),
                        cursorHeight: 18,
                        showCursor: true,
                        controller: nameController,
                        style: TextStyle(color: MyColors().titleColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Nome',
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
                  'Adicionar\nAlunos',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        });
      });
}
