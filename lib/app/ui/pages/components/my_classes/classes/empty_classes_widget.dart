import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/create_class_dialog.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyClassesWidget extends StatelessWidget {
  final Discipline discipline;
  const EmptyClassesWidget({super.key, required this.discipline});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 100,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border:
                Border.fromBorderSide(BorderSide(color: MyColors().titleColor)),
            borderRadius: BorderRadius.circular(12),
            gradient: MyColors().gradientHomePageTitle()),
        child: InkWell(
          onTap: () async {
            await createClassDialog(context: context, discipline: discipline);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                'Criar turma',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
