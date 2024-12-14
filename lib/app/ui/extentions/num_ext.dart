extension FormatNumber on num {
  double finalQuarterGradeRound() {
    double result = this.floorToDouble();
    String strNum = toStringAsFixed(2);
    strNum = strNum.substring(strNum.indexOf('.') + 1);
    int? value = int.tryParse(strNum);
    if (value != null) {
      if (value > 24 && value < 74) {
        result += .5;
      }
      if (value > 74) {
        result += 1.0;
      }
    }
    return result;
  }

  // String floorWhithPoints() {
  //   String strNum = toStringAsFixed(0);

  //   List<String> firstStr = strNum.split('');

  //   int nubOfPoints = ((firstStr.length - 1) / 3).floor();

  //   for (int i = 0; i < nubOfPoints; i++) {
  //     firstStr.insert(firstStr.length - (4 * i + 3), '.');
  //   }

  //   String result = firstStr.join();

  //   return result;
  // }

  // String toMoney() {
  //   String strNum = toStringAsFixed(2);

  //   strNum = strNum.replaceAll('.', ',');

  //   int separate = strNum.indexOf(',');
  //   List<String> strList = [
  //     strNum.substring(0, separate),
  //     strNum.substring(separate)
  //   ];

  //   List<String> firstStr = strList[0].split('');
  //   int nubOfPoints = ((firstStr.length - 1) / 3).floor();
  //   for (int i = 0; i < nubOfPoints; i++) {
  //     firstStr.insert(firstStr.length - (4 * i + 3), '.');
  //   }
  //   firstStr.addAll([strList[1]]);
  //   String result = firstStr.join();

  //   return 'R\$ $result';
  // }

  // String toPercentage() => '${(this).toStringAsFixed(2)}%';
}
