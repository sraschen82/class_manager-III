import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/states/discipline_states.dart';
import 'package:class_manager/app/interactors/stores/discipline_store.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/empty_disciplines_widget.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/show_disciplines_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinesWidget extends StatefulWidget {
  const DisciplinesWidget({super.key});

  @override
  State<DisciplinesWidget> createState() => _DisciplinesWidgetState();
}

class _DisciplinesWidgetState extends State<DisciplinesWidget> {
  List<Discipline> list = [];
  int? year;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        year = await context.read<DataBase>().user.schoolYears.first.year;
        if (year != null) {
          await context
              .read<DisciplineStore>()
              .getAllDiscilpine(year: year!)
              .then(
                (value) => list.addAll(value),
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DisciplineStore store = context.watch<DisciplineStore>();

    return StreamBuilder(
      stream: store.disciplineStream,
      builder: (context, snapshot) {
        late Widget child;

        if (snapshot.connectionState == ConnectionState.waiting) {
          child = SizedBox(
            height: 30,
            child: CircularProgressIndicator(
              backgroundColor: MyColors().paletteColor1,
              color: MyColors().titleColor,
            ),
          );
        } else if (snapshot.hasError) {
          child = SizedBox.shrink();
        } else if (snapshot.hasData) {
          DisciplineStates state = snapshot.data!;
          if (state is Empty) {
            child = EmptyDisciplinesWidget();
          }
          if (state is Loading) {
            child = SizedBox(
                height: 50,
                child: CircularProgressIndicator(
                  backgroundColor: MyColors().paletteColor1,
                  color: MyColors().titleColor,
                ));
          }
          if (state is Error) {
            child = SizedBox(
                height: 50,
                child: Center(
                  child: Text(state.message),
                ));
          }
          if (state is Loaded) {
            child = ShowDisciplinesWidget();
          }
        }

        return child;
      },
    );
  }
}
