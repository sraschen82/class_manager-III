import 'package:class_manager/app/interactors/entities/school_year_entity.dart';
import 'package:class_manager/app/interactors/stores/school_year_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> addSchoolYearDialog({required BuildContext context}) async {
  TextEditingController titleController = TextEditingController();
  int suggestionsYear = DateTime.now().year;
  return showDialog(
      context: context,
      builder: (context) {
        validateForm() async {
          SchoolYear schoolYear;
          int? year;
          titleController.text.isEmpty
              ? {
                  schoolYear = SchoolYear()
                    ..year = suggestionsYear
                    ..disicplines = [],
                  await context
                      .read<SchoolYearStore>()
                      .saveSchoolYear(schoolYear: schoolYear),
                  Navigator.pop(context),
                }
              : {
                  if (titleController.text.length == 4)
                    {
                      year = int.tryParse(titleController.text),
                      year != null && year >= suggestionsYear
                          ? {
                              schoolYear = SchoolYear()
                                ..year = year
                                ..disicplines = [],
                              await context
                                  .read<SchoolYearStore>()
                                  .saveSchoolYear(schoolYear: schoolYear),
                              Navigator.pop(context),
                            }
                          : {
                              titleController.clear(),
                            },
                    }
                };
        }

        return AlertDialog(
          backgroundColor: MyColors().dialogWidgetColor,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors().titleColor),
            borderRadius: BorderRadius.circular(12),
          ),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          title: const Center(
              child: Text(
            'CRIAR ANO LETIVO',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          content: SingleChildScrollView(
            child: Card(
              color: MyColors().dialogWidgetColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLength: 30,
                  cursorColor: MyColors().titleColor,
                  cursorRadius: const Radius.circular(15),
                  cursorHeight: 18,
                  showCursor: true,
                  controller: titleController,
                  style: TextStyle(color: MyColors().titleColor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Ano',
                      hintText: suggestionsYear.toString(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors().titleColor,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors().titleColor,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors().titleColor,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: MyColors().titleColor,
                      floatingLabelStyle: TextStyle(
                        color: MyColors().titleColor,
                      )),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(
              onPressed: () => validateForm(),
              child: const Text('Save'),
            ),
          ],
        );
      });
}
