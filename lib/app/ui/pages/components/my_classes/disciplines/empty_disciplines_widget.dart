import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/create_discipline_button.dart';
import 'package:flutter/material.dart';

class EmptyDisciplinesWidget extends StatelessWidget {
  const EmptyDisciplinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.red,
      child: createDisciplineButton(context: context, size: 60),
    );
  }
}
