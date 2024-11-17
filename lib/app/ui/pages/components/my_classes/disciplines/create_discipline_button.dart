import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/create_discipline_dialog.dart';
import 'package:flutter/material.dart';

Widget createDisciplineButton({required BuildContext context, required double size}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: size,
      width: size * 1.61,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.add,
              size: size * .66,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Criar Disciplina',
                style: TextStyle(fontSize: size * .22),
              )),
          InkWell(
            onTap: () async {
              await createDisciplineDialog(context);
            },
          )
        ],
      ),
    ),
  );
}
