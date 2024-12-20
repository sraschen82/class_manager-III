extension SchedullesExt on List<String> {
  List<String> initialValues() => List.generate(
        6,
        (index) => this.isEmpty ? '' : this[index],
      );
}
