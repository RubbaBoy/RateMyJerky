extension StringUtils on String {
  int toInt() => int.tryParse(this);
}