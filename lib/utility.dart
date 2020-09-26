const DEFAULT_LOCATION = 'Vending Machine';
const LOCATIONS = ['The Commons', 'Crossroads Market', 'Crossroads Cafe', DEFAULT_LOCATION, 'Corner Store', 'Sol\'s Underground'];

extension StringUtils on String {
  int toInt() => int.tryParse(this);
}