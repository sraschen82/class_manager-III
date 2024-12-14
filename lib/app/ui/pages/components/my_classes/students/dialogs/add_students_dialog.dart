import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> addStudentsDialog(
    {required BuildContext context,
    required SchoolClass schoolClass,
    required Discipline discipline}) async {
  TextEditingController nameController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        nameController.text = nameController.text.trim();

        validateForm() async {
          FocusManager.instance.primaryFocus?.unfocus();
          if (nameController.text.length > 3 &&
              nameController.text.contains(' ')) {
            await context.read<StudentStore>().addStudentsByList(
                listNames: nameController.text,
                schoolClass: schoolClass,
                discipline: discipline);
          }
          Navigator.pop(context);
        }

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
                'INSERIR ALUNO',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text('${discipline.longName}')
            ],
          )),
          content: SizedBox(
            height: 100,
            width: 200,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        cursorColor: MyColors().titleColor,
                        cursorRadius: const Radius.circular(15),
                        cursorHeight: 18,
                        minLines: 1,
                        maxLines: 50,
                        onChanged: (value) => nameController.value =
                            TextEditingValue(text: value.toUpperCase()),
                        showCursor: true,
                        controller: nameController,
                        style: TextStyle(color: MyColors().titleColor),
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Nome(s)',
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
                        onFieldSubmitted: (value) => validateForm(),
                        textInputAction: TextInputAction.newline,
                      ),
                    ],
                  )),
            ),
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
          ],
        );
      });
}
