extension MapExt on Map<String, double> {
  Map<String, double> invertOrder() {
    List<MapEntry<String, double>> entries = this.entries.toList();
    entries = entries.reversed.toList();
    return Map.fromEntries(entries);
  }
}

extension MapExt2 on Map<int, List<double>> {
  Map<int, List<double>> currentYear() {
    removeWhere(
      (key, value) => key != DateTime.now().year,
    );
    List<double> newValues = [];

    newValues.addAll(this
        .values
        .map(
          (e) => e.sublist(0, DateTime.now().month - 1),
        )
        .first);

    print('newValues: $newValues');

    this.values.map(
          (e) => e = newValues,
        );
    // this.values.map(
    //       (e) => e.sublist(0, DateTime.now().month - 1),
    //     );

    // print(this.values.map(
    //       (e) => e.sublist(0, DateTime.now().month - 1),
    //     ));
    // removeWhere(
    //   (key, value) => value.any(
    //     (element) => value.indexOf(element) > DateTime.now().month,
    //   ),
    // );

    List<MapEntry<int, List<double>>> entries = this.entries.toList();
    entries = entries.reversed.toList();
    print(entries);
    return Map.fromEntries(entries);
  }
}
