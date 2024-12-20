import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:class_manager/app/interactors/stores/schedulles_store.dart';
import 'package:class_manager/app/ui/pages/components/home_page/shedulles/create_schedulle_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmpySchedullesWidget extends StatefulWidget {
  @override
  State<EmpySchedullesWidget> createState() => _EmpySchedullesWidgetState();
}

class _EmpySchedullesWidgetState extends State<EmpySchedullesWidget> {
  bool? haveAnyClass;

  @override
  Widget build(BuildContext context) {
    final store = context.watch<SchedullesStore>();
    haveAnyClass = store.checkCreatingSchedullesCondictions();

    late Widget child;

    switch (haveAnyClass) {
      case false:
        child = Text('Você ainda não possui turma registrada.');

      case null:
        child = SizedBox.shrink();
      case true:
        child = DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: MyColors().titleColor),
              gradient: MyColors().gradientHomePage()),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateSchedulleWidget(
                                    schedulles: Schedulles.empty())));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateSchedulleWidget(
                                    schedulles: Schedulles.empty())));
                      },
                      icon: Icon(
                        Icons.upload,
                      ),
                    ),
                    Text('Criar horário'),
                  ],
                )),
          ),
        );
    }

    return child;
  }
}
