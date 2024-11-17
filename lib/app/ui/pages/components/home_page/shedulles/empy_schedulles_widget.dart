import 'package:class_manager/app/interactors/stores/schedulles_store.dart';
import 'package:flutter/material.dart';

class EmpySchedullesWidget extends StatelessWidget {
  final double width;
  final double heigth;
  final SchedullesStore store;
  const EmpySchedullesWidget(
      {super.key,
      required this.width,
      required this.heigth,
      required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  await store.checkCreatingSchedullesCondictions();
                },
                icon: Icon(
                  Icons.upload,
                ),
              ),
              Text('Criar horário'),
            ],
          )),
    );
  }
}
