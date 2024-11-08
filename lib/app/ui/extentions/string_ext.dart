extension StringExt on String {
  removeNull() => replaceAll('null', '');
}
