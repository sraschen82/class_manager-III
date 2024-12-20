import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/discipline_entity.dart';
import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:class_manager/app/interactors/entities/school_class_entity.dart';
import 'package:class_manager/app/interactors/stores/schedulles_store.dart';
import 'package:class_manager/app/ui/extentions/list_string_ext.dart';
import 'package:class_manager/app/ui/extentions/schedulles_ext.dart';
import 'package:class_manager/app/ui/extentions/string_ext.dart';
import 'package:class_manager/app/ui/pages/initial_page.dart';
import 'package:class_manager/app/ui/ui_elements/app_buttons.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateSchedulleWidget extends StatefulWidget {
  final Schedulles schedulles;
  const CreateSchedulleWidget({super.key, required this.schedulles});

  @override
  State<CreateSchedulleWidget> createState() => _CreateSchedulleWidgetState();
}

class _CreateSchedulleWidgetState extends State<CreateSchedulleWidget> {
  List<String> mondayMorning = List.filled(6, '');
  List<String> tuesdayMorning = List.filled(6, '');
  List<String> wednesdayMorning = List.filled(6, '');
  List<String> thursdayMorning = List.filled(6, '');
  List<String> fridayMorning = List.filled(6, '');

  List<String> mondayAfternoon = List.filled(6, '');
  List<String> tuesdayAfternoon = List.filled(6, '');
  List<String> wednesdayAfternoon = List.filled(6, '');
  List<String> thursdayAfternoon = List.filled(6, '');
  List<String> fridayAfternoon = List.filled(6, '');

  bool isMornigSchedulles = true;

  double size = 35;
  List<double> sizeList = List.generate(
    6,
    (index) => 35,
  );

  @override
  void initState() {
    super.initState();

    mondayMorning = widget.schedulles.mondayMorning.initialValues();
    tuesdayMorning = widget.schedulles.tuesdayMorning.initialValues();
    wednesdayMorning = widget.schedulles.wednesdayMorning.initialValues();
    thursdayMorning = widget.schedulles.thursdayMorning.initialValues();
    fridayMorning = widget.schedulles.fridayMorning.initialValues();
    mondayAfternoon = widget.schedulles.mondayAfternoon.initialValues();
    tuesdayAfternoon = widget.schedulles.tuesdayAfternoon.initialValues();
    wednesdayAfternoon = widget.schedulles.wednesdayAfternoon.initialValues();
    thursdayAfternoon = widget.schedulles.thursdayAfternoon.initialValues();
    fridayAfternoon = widget.schedulles.fridayAfternoon.initialValues();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final user = context.watch<DataBase>().user;
    List<Discipline> disciplines = user.schoolYears.first.disicplines!;

    Widget classesWidget(int disciplineIndex, List<SchoolClass> list) {
      List<Widget> listWidget = [];

      List.generate(list.length, (indexClass) {
        listWidget.add(Draggable<String>(
          data: disciplines[disciplineIndex].isRegularDiscipline == false
              ? 'ELET'
              : '${disciplines[disciplineIndex].classes![indexClass].name}\n${disciplines[disciplineIndex].shortName}'
                  .toUpperCase()
                  .centralized(10),
          onDragCompleted: () => setState(() {
            sizeList = List.generate(
              6,
              (index) => 35,
            );
          }),
          onDraggableCanceled: (velocity, offset) => {
            setState(() {
              sizeList = List.generate(
                6,
                (index) => 35,
              );
            })
          },
          feedback: Card(
            color: Colors.grey,
            child: SizedBox(
                height: 40,
                width: 70,
                child: Center(child: Text('${list[indexClass].name}'))),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyColors().titleColor),
                  gradient: MyColors().gradientHomePage()),
              child: SizedBox(
                  height: 30,
                  width: 60,
                  child: Center(
                      child: OverflowBox(
                          maxHeight: 20,
                          maxWidth: 40,
                          child: Text('${list[indexClass].name}')))),
            ),
          ),
        ));
      }, growable: true);

      return Column(
        children: listWidget,
      );
    }

    List<DataColumn> columns() {
      return List.generate(
        6,
        (index) => DataColumn(
          headingRowAlignment: MainAxisAlignment.center,
          label: index == 0
              ? isMornigSchedulles
                  ? Center(child: Text('M'))
                  : Center(child: Text('T'))
              : Center(
                  child: Text('${user.schedulles!.weekdays()[index - 1]}')),
        ),
      );
    }

    DataCell tableRow(
        {required int index,
        required int dayIndex,
        required List<String> list}) {
      return DataCell(Center(
          child: DragTarget<String>(
        onWillAcceptWithDetails: (details) {
          setState(() {
            sizeList.replaceRange(dayIndex, dayIndex + 1, [50]);
          });
          return true;
        },
        onAcceptWithDetails: (DragTargetDetails<String> details) {
          setState(() {
            sizeList.replaceRange(dayIndex, dayIndex + 1, [35]);

            list.removeAt(index);
            list.insert(index, details.data);
          });
        },
        builder: (context, candidateData, rejectedData) => Container(
          height: sizeList[dayIndex],
          width: sizeList[dayIndex] * 1.2,
          child: list.isNotEmpty
              ? Center(child: Text('${list[index]}'))
              : Center(child: Text('')),
        ),
      )));
    }

    List<DataRow> rows() {
      return List.generate(
          6,
          (index) => DataRow(cells: [
                DataCell(Center(
                    child: Text('${user.schedulles!.periodList()[index]}'))),
                isMornigSchedulles
                    ? tableRow(index: index, dayIndex: 0, list: mondayMorning)
                    : tableRow(
                        index: index, dayIndex: 0, list: mondayAfternoon),
                isMornigSchedulles
                    ? tableRow(index: index, dayIndex: 1, list: tuesdayMorning)
                    : tableRow(
                        index: index, dayIndex: 1, list: tuesdayAfternoon),
                isMornigSchedulles
                    ? tableRow(
                        index: index, dayIndex: 2, list: wednesdayMorning)
                    : tableRow(
                        index: index, dayIndex: 2, list: wednesdayAfternoon),
                isMornigSchedulles
                    ? tableRow(index: index, dayIndex: 3, list: thursdayMorning)
                    : tableRow(
                        index: index, dayIndex: 3, list: thursdayAfternoon),
                isMornigSchedulles
                    ? tableRow(index: index, dayIndex: 4, list: fridayMorning)
                    : tableRow(
                        index: index, dayIndex: 4, list: fridayAfternoon),
              ]));
    }

    Future<void> saveScheddule() async {
      Schedulles newSchedulles = Schedulles()
        ..mondayMorning = mondayMorning
        ..mondayAfternoon = mondayAfternoon
        ..tuesdayMorning = tuesdayMorning
        ..tuesdayAfternoon = tuesdayAfternoon
        ..wednesdayMorning = wednesdayMorning
        ..wednesdayAfternoon = wednesdayAfternoon
        ..thursdayMorning = thursdayMorning
        ..thursdayAfternoon = thursdayAfternoon
        ..fridayMorning = fridayMorning
        ..fridayAfternoon = fridayAfternoon;
      await context
          .read<SchedullesStore>()
          .saveSchedulles(newSchedulles: newSchedulles);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                InitialPage(title: 'Class Manager', pageNumb: 2),
          ));
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: MyColors().titleColor),
              gradient: MyColors().gradientHomePage()),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: MyColors().titleColor),
                                gradient: MyColors().gradientHomePage()),
                            child: SizedBox.expand(
                                child: Card(
                              color: Colors.transparent,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () =>
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InitialPage(
                                                          title:
                                                              'Class Manager',
                                                          pageNumb: 2),
                                                )),
                                        icon: Icon(Icons.arrow_back_ios_new)),
                                    Text(
                                      'MEUS HORÁRIOS',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await saveScheddule();
                                        },
                                        icon: Icon(Icons.save)),
                                  ],
                                ),
                              ),
                            ))),
                      ),
                    ),
                    Flexible(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: MyColors().titleColor),
                                  gradient: MyColors().gradientHomePage()),
                              child: SizedBox.expand(
                                  child: ListView.builder(
                                itemCount: disciplines.length,
                                addAutomaticKeepAlives: true,
                                padding: EdgeInsets.only(bottom: 5),
                                physics: NeverScrollableScrollPhysics(),
                                itemExtent: width / disciplines.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  List<SchoolClass> classesList =
                                      disciplines[index].classes!;

                                  return SingleChildScrollView(
                                    child: Card(
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8, 0, 8),
                                            child: Text(
                                                '${disciplines[index].shortName}'),
                                          ),
                                          classesWidget(index, classesList),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ))),
                        )),
                    Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: MyColors().titleColor),
                                gradient: MyColors().gradientHomePage()),
                            child: SizedBox.expand(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Draggable<String>(
                                    data: '',
                                    onDragCompleted: () => setState(() {
                                      sizeList = List.generate(
                                        6,
                                        (index) => 35,
                                      );
                                    }),
                                    onDraggableCanceled: (velocity, offset) => {
                                      setState(() {
                                        sizeList = List.generate(
                                          6,
                                          (index) => 35,
                                        );
                                      })
                                    },
                                    feedback: Card(
                                      color: Colors.grey,
                                      child: SizedBox(
                                          height: 40,
                                          width: 70,
                                          child: Center(child: Text(''))),
                                    ),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: MyColors().titleColor),
                                          gradient:
                                              MyColors().gradientHomePage()),
                                      child: SizedBox(
                                          height: 30,
                                          width: 60,
                                          child: Card(
                                              color: Colors.transparent,
                                              child: Text(
                                                'Vazio',
                                                textAlign: TextAlign.center,
                                              ))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 60,
                                    child: AppButtons.gradientButton(
                                      text: 'Limpar',
                                      action: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateSchedulleWidget(
                                                      schedulles:
                                                          widget.schedulles,
                                                    )));
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: MyColors().titleColor),
                                            gradient: isMornigSchedulles
                                                ? MyColors()
                                                    .gradientSelectedButton()
                                                : MyColors()
                                                    .gradientHomePage()),
                                        child: SizedBox(
                                          height: 30,
                                          width: 70,
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isMornigSchedulles =
                                                    !isMornigSchedulles;
                                              });
                                            },
                                            child: Text(
                                              'Manhã',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: MyColors().titleColor),
                                            gradient: !isMornigSchedulles
                                                ? MyColors()
                                                    .gradientSelectedButton()
                                                : MyColors()
                                                    .gradientHomePage()),
                                        child: SizedBox(
                                          height: 30,
                                          width: 70,
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                isMornigSchedulles =
                                                    !isMornigSchedulles;
                                              });
                                            },
                                            child: Text(
                                              'Tarde',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 10,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: MyColors().titleColor),
                                gradient: MyColors().gradientStudentCard()),
                            child: SizedBox.expand(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Center(
                                  child: DataTable(
                                    columns: columns(),
                                    rows: rows(),
                                    columnSpacing: width / 22,
                                    border: TableBorder.all(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    headingRowColor:
                                        const WidgetStatePropertyAll(
                                            Color.fromARGB(255, 112, 1, 1)),
                                    dataRowColor: const WidgetStatePropertyAll(
                                        Color.fromARGB(255, 153, 3, 3)),
                                    horizontalMargin: 15,
                                  ),
                                ),
                              ),
                            ))),
                    Flexible(flex: 1, child: Text(''))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
