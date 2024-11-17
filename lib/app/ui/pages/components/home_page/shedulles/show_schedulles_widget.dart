import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:flutter/material.dart';

class ShowSchedullesWidget extends StatelessWidget {
  final Schedulles schedulles;
  const ShowSchedullesWidget({super.key, required this.schedulles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Text('Mostrar horário.'),
      ),
    );
  }
}
