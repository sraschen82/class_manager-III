import 'package:class_manager/app/interactors/entities/schedulles_entity.dart';
import 'package:class_manager/app/ui/extentions/schedulles_ext.dart';
import 'package:class_manager/app/ui/pages/components/home_page/shedulles/create_schedulle_widget.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class SchedullesWidget extends StatelessWidget {
  final Schedulles schedulles;
  const SchedullesWidget({super.key, required this.schedulles});

  @override
  Widget build(BuildContext context) {
    double size = 25;
    final width = MediaQuery.of(context).size.width;

    List<DataColumn> columns(String shift) {
      return List.generate(
        6,
        (index) => DataColumn(
            headingRowAlignment: MainAxisAlignment.center,
            label: Container(
              height: size,
              width: size * .8,
              child: index == 0
                  ? Center(
                      child: shift.contains('M')
                          ? Text('M',
                              style: TextStyle(color: MyColors().headTableText))
                          : Text('T',
                              style:
                                  TextStyle(color: MyColors().headTableText)))
                  : Center(
                      child: Text(
                      '${schedulles.weekdays()[index - 1]}',
                      style: TextStyle(
                          fontSize: 10, color: MyColors().headTableText),
                    )),
            )),
      );
    }

    DataCell tableRow({required int index, required List<String> list}) =>
        DataCell(Center(
            child: Container(
                height: size,
                width: size * 1.2,
                child: Center(
                    child: Text(
                  '${list[index]}',
                  style: TextStyle(fontSize: 8),
                )))));

    List<DataRow> rows(String shift) {
      return List.generate(
          6,
          (index) => DataRow(cells: [
                DataCell(Center(
                  child: Text(
                    '${schedulles.periodList()[index]}',
                    style: TextStyle(
                        color: MyColors().headTableText,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                shift.contains('M')
                    ? tableRow(index: index, list: schedulles.mondayMorning)
                    : tableRow(index: index, list: schedulles.mondayAfternoon),
                shift.contains('M')
                    ? tableRow(index: index, list: schedulles.tuesdayMorning)
                    : tableRow(index: index, list: schedulles.tuesdayAfternoon),
                shift.contains('M')
                    ? tableRow(index: index, list: schedulles.wednesdayMorning)
                    : tableRow(
                        index: index, list: schedulles.wednesdayAfternoon),
                shift.contains('M')
                    ? tableRow(index: index, list: schedulles.thursdayMorning)
                    : tableRow(
                        index: index, list: schedulles.thursdayAfternoon),
                shift.contains('M')
                    ? tableRow(index: index, list: schedulles.fridayMorning)
                    : tableRow(index: index, list: schedulles.fridayAfternoon),
              ]));
    }

    return SizedBox(
      height: width * .5,
      width: width * .82,
      child: ListView.builder(
          itemCount: schedulles.numberOfTables().length,
          scrollDirection: Axis.horizontal,
          physics: PageScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: InkWell(
                  onLongPress: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateSchedulleWidget(
                                  schedulles: schedulles,
                                )));
                  },
                  child: InteractiveViewer(
                    onInteractionEnd: (details) => {},
                    child: DataTable(
                      dataRowMaxHeight: width * .5 / 8,
                      dataRowMinHeight: 15,
                      headingRowHeight: width * .5 / 8,
                      columns: columns(schedulles.numberOfTables()[index]),
                      rows: rows(schedulles.numberOfTables()[index]),
                      columnSpacing: width / 22,
                      border: TableBorder.all(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      headingRowColor:
                          WidgetStatePropertyAll(MyColors().alertColor),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: MyColors().titleColor),
                          gradient: MyColors().gradientStudentCard()),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
