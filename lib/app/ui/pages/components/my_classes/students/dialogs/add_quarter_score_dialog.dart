import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:class_manager/app/interactors/stores/student_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddQuarterScoreDialog extends StatelessWidget {
  final Student student;
  final SchoolClass schoolClass;
  final Discipline discipline;
  final int quarterNumb;
  const AddQuarterScoreDialog(
      {super.key,
      required this.student,
      required this.schoolClass,
      required this.discipline,
      required this.quarterNumb});

  @override
  Widget build(BuildContext context) {
    TextEditingController scoreController = TextEditingController();
    validateForm() async {
      FocusManager.instance.primaryFocus?.unfocus();

      String str = scoreController.text;
      str = str.replaceAll(r',', '.');

      double? score = double.tryParse(str);

      if (score != null && score >= 0 && score <= 10) {
        await context.read<StudentStore>().addQuarterScore(
            student: student,
            quarterNumb: quarterNumb,
            score: score,
            schoolClass: schoolClass,
            discipline: discipline);
        Navigator.pop(context, true);
      } else {
        scoreController.clear();
      }
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
            '${student.name}',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${discipline.longName} - ${quarterNumb}ºTRI'),
          ),
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
                    textAlign: TextAlign.center,
                    maxLength: 4,
                    minLines: 1,
                    maxLines: 50,
                    onChanged: (value) => scoreController.value =
                        TextEditingValue(text: value.toUpperCase()),
                    showCursor: true,
                    controller: scoreController,
                    style: TextStyle(color: MyColors().titleColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Nota da Avaliação',
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
                    textInputAction: TextInputAction.next,
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
  }
}
