import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

Future<void> confirmDialog(
    {required BuildContext context,
    required String title,
    required String text,
    required void Function() action}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors().alertColor,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors().titleColor),
            borderRadius: BorderRadius.circular(12),
          ),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          title: Center(
              child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          content: Card(
            color: const Color.fromARGB(255, 100, 4, 4),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      text,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            TextButton(
              onPressed: action,
              child: const Text('Confirmar'),
            ),
          ],
        );
      });
}
