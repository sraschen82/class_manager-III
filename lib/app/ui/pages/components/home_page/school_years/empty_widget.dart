import 'package:class_manager/app/ui/pages/components/home_page/school_years/add_school_year_dialog.dart';
import 'package:flutter/material.dart';

class EmptySchoolYearWidget extends StatelessWidget {
  const EmptySchoolYearWidget({
    super.key,
    required this.width,
    required this.heigth,
  });

  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: SizedBox(
        width: width,
        height: heigth * .1,
        child: Column(
          children: [
            IconButton(
              onPressed: () async {
                await addSchoolYearDialog(context: context);
              },
              icon: Icon(
                Icons.add,
              ),
            ),
            Text('Criar ano letivo.')
          ],
        ),
      ),
    );
  }
}
