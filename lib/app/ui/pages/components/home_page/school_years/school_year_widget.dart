import 'package:class_manager/app/interactors/entities/school_year_entity.dart';
import 'package:class_manager/app/interactors/states/school_year_states.dart';
import 'package:class_manager/app/interactors/stores/school_year_store.dart';
import 'package:class_manager/app/ui/extentions/text_ext.dart';
import 'package:class_manager/app/ui/pages/components/home_page/school_years/empty_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolYearWidget extends StatefulWidget {
  const SchoolYearWidget({super.key});

  @override
  State<SchoolYearWidget> createState() => _SchoolYearWidgetState();
}

class _SchoolYearWidgetState extends State<SchoolYearWidget> {
  List<SchoolYear> schoolYears = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<SchoolYearStore>().getAllSchoolYears().then(
        (value) {
          if (value.isNotEmpty) {
            schoolYears.addAll(value);
          }
        },
      );
      await context.read<SchoolYearStore>().schoolYearStream.listen(
        (event) {
          print(event);
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchoolYearStore store = context.watch<SchoolYearStore>();
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: StreamBuilder(
        stream: store.schoolYearStream,
        initialData: Empty(),
        builder: (context, snapshot) {
          print(snapshot.data);
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
            SchoolYearStates state = snapshot.data!;
            if (state is Empty) {
              child = EmptySchoolYearWidget(width: width, heigth: heigth);
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
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${state.schoolYears.first.year}')
                            .removeNullAndEditSize(20),
                        // DrawerButton(
                        //   onPressed: () {
                        //     Scaffold.of(context).openDrawer();
                        //   },
                        // ),
                        // DropdownButton<int>(
                        //   isDense: true,
                        //   value: null,
                        //   icon: Icon(
                        //     Icons.arrow_drop_down,
                        //     color: MyColors().titleColor,
                        //   ),
                        //   items: [
                        //     DropdownMenuItem(
                        //         value: 0, child: Text('Adicionar ano letivo.')),
                        //     DropdownMenuItem(
                        //         value: 1, child: Text('Remover ano letivo.')),
                        //   ],
                        //   onChanged: (value) {},
                        // )
                      ],
                    ),
                  ));
            }
          }
          return child;
        },
      ),
    );
  }
}