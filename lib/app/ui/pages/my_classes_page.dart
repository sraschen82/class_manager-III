import 'package:class_manager/app/interactors/states/school_year_states.dart';
import 'package:class_manager/app/interactors/stores/school_year_store.dart';
import 'package:class_manager/app/ui/pages/components/home_page/school_years/empty_widget.dart';
import 'package:class_manager/app/ui/pages/components/my_classes/disciplines/disciplines_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyClasses extends StatefulWidget {
  const MyClasses({super.key});

  @override
  State<MyClasses> createState() => _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<SchoolYearStore>().getAllSchoolYears();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final store = context.watch<SchoolYearStore>();

    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(2.0),
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: MyColors().gradientHomePage()),
        child: SizedBox.expand(
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(gradient: MyColors().gradientHomePage()),
                  child: SizedBox.expand(
                      child: Card(
                    color: Colors.black.withOpacity(.2),
                    elevation: 20,
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          if (store.db.user.schoolYears.isNotEmpty)
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                store.db.user.schoolYears.first.year.toString(),
                                style: TextStyle(
                                    color: MyColors().gold.withOpacity(.7),
                                    fontSize: 50),
                              ),
                            ),
                          Align(
                            alignment: store.db.user.schoolYears.isNotEmpty
                                ? Alignment.bottomCenter
                                : Alignment.center,
                            child: Text(
                              'MINHAS TURMAS',
                              style: TextStyle(
                                  color: MyColors().titleColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
              Flexible(
                flex: 12,
                child: DecoratedBox(
                    decoration:
                        BoxDecoration(gradient: MyColors().gradientHomePage()),
                    child: SizedBox.expand(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: StreamBuilder(
                                stream: store.schoolYearStream,
                                initialData: Empty(),
                                builder: (context, snapshot) {
                                  late Widget child;
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    child = SizedBox(
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        backgroundColor:
                                            MyColors().paletteColor1,
                                        color: MyColors().titleColor,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    child = SizedBox.shrink();
                                  } else if (snapshot.hasData) {
                                    SchoolYearStates state = snapshot.data!;
                                    if (state is Empty) {
                                      child = EmptySchoolYearWidget(
                                          width: width, heigth: heigth);
                                    }
                                    if (state is Loading) {
                                      child = SizedBox(
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            backgroundColor:
                                                MyColors().paletteColor1,
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
                                      child = DisciplinesWidget();
                                    }
                                  }
                                  return child;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
