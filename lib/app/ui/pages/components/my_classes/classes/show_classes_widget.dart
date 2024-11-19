import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowClassesWidget extends StatefulWidget {
  final Discipline discipline;
  const ShowClassesWidget({super.key, required this.discipline});

  @override
  State<ShowClassesWidget> createState() => _ShowClassesWidgetState();
}

class _ShowClassesWidgetState extends State<ShowClassesWidget> {
  List<SchoolClass> list = [];

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    context.watch<SchoolClassStore>();
    list.clear();
    list.addAll(widget.discipline.classes!);
    return Card(
      child: SizedBox(
        height: heigth,
        width: width,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Text('Dados das turmas de ${widget.discipline.longName}'),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: list.length,
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${list[index].name}'),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
