import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

extension TextExt on Text {
  underInfoStyle() =>
      Text(data!, style: const TextStyle(color: Colors.grey, fontSize: 10));

  stockPriceStyle() =>
      Text(data!, style: TextStyle(fontSize: 16, color: MyColors().gold));

  Text evaluateChangesStyle() {
    double? value = double.tryParse(data!);

    if (value != null) {
      if (value < 6) {
        return Text(
          '$value',
          style: const TextStyle(
              color: Color.fromARGB(255, 231, 9, 9),
              fontWeight: FontWeight.bold),
        );
      } else {
        return Text(
          '${value}',
          style: const TextStyle(color: Color.fromARGB(255, 31, 63, 247)),
        );
      }
    } else {
      return const Text('');
    }
  }

  evaluateChangesPercentStyle() {
    double? value = double.tryParse(data!);
    if (value != null) {
      if (value < 0) {
        return Text(
          '(${value.toStringAsFixed(2)}%)',
          style: const TextStyle(color: Color.fromARGB(255, 247, 85, 74)),
        );
      } else {
        return Text(
          '(+${value.toStringAsFixed(2)}%)',
          style: const TextStyle(color: Colors.green),
        );
      }
    } else {
      return const Text('');
    }
  }

  Text removeNullAndEditSize(double size) =>
      Text(data!.replaceAll('null', ''), style: TextStyle(fontSize: size));
}
