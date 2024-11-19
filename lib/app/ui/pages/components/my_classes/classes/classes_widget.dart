import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/states/school_class_states.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/empty_classes_widget.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/classes/show_classes_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassesWidget extends StatefulWidget {
  final Discipline discipline;
  const ClassesWidget({super.key, required this.discipline});

  @override
  State<ClassesWidget> createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<SchoolClassStore>()
            .getClasses(discipline: widget.discipline);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SchoolClassStore store = context.watch<SchoolClassStore>();

    return StreamBuilder(
      stream: store.classStream,
      builder: (context, snapshot) {
        late Widget child;
        if (snapshot.connectionState == ConnectionState.waiting) {
          child = Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 30,
              child: CircularProgressIndicator(
                backgroundColor: MyColors().paletteColor1,
                color: MyColors().titleColor,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          child = SizedBox.shrink();
        } else if (snapshot.hasData) {
          SchoolClassStates state = snapshot.data!;
          if (state is Empty) {
            child = EmptyClassesWidget(
              discipline: widget.discipline,
            );
          } else if (state is Error) {
            child = SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: Text(state.message),
                ));
          }
          if (state is Loading) {
            child = Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SizedBox(
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: MyColors().paletteColor1,
                    color: MyColors().titleColor,
                  )),
            );
          } else if (state is Loaded) {
            child = ShowClassesWidget(
              discipline: widget.discipline,
            );
          }
        }

        return child;
      },
    );
  }
}
