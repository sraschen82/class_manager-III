import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/create_discipline_dialog.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

Widget createDisciplineButton(
    {required BuildContext context, required double size}) {
  return SizedBox(
    height: 70,
    width: 110,
    child: DecoratedBox(
      decoration: BoxDecoration(
          border:
              Border.fromBorderSide(BorderSide(color: MyColors().titleColor)),
          borderRadius: BorderRadius.circular(12),
          gradient: MyColors().gradientHomePageTitle()),
      child: InkWell(
        onTap: () async {
          await createDisciplineDialog(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Criar Disciplina',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
