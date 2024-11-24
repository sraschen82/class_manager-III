import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/entities/student_entity.dart';
import 'package:flutter/material.dart';

class TopComponent extends StatelessWidget {
  final Student student;
  final SchoolClass schoolClass;
  const TopComponent({
    super.key,
    required this.student,
    required this.schoolClass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.transparent,
          margin: const EdgeInsets.fromLTRB(8, 30, 8, 15),
          child: Text(
            'EDITAR ALUNO',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          color: Colors.transparent,
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 15),
          child: Text(
            '${student.name} - ${schoolClass.name}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
