import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:class_manager/app/interactors/states/schedulles_states.dart';
import 'package:class_manager/app/interactors/stores/schedulles_store.dart';
import 'package:class_manager/app/ui/pages/components/home_page/shedulles/empy_schedulles_widget.dart';
import 'package:class_manager/app/ui/pages/components/home_page/shedulles/show_schedulles_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchedullesWidget extends StatefulWidget {
  const SchedullesWidget({super.key});

  @override
  State<SchedullesWidget> createState() => _SchedullesWidgetState();
}

class _SchedullesWidgetState extends State<SchedullesWidget> {
  late Schedulles schedulles;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<SchedullesStore>().getSchedulles().then(
          (value) {
            if (value != null) {
              schedulles = value;
            } else {
              schedulles = Schedulles.empty();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedullesStore store = context.watch<SchedullesStore>();

    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: store.schedullesStream,
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
          SchedullesStates state = snapshot.data!;
          if (state is Empty) {
            child = EmpySchedullesWidget(
              width: width,
              heigth: heigth,
              store: store,
            );
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
            child = SizedBox(
                child: Center(
                    child: ShowSchedullesWidget(
              schedulles: state.schedulles,
            )));
          }
        }
        return child;
      },
    );
  }
}