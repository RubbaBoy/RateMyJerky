import 'package:flutter/cupertino.dart';
import 'package:rate_my_jerky/enums/view_states.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/services/navigation_service.dart';
import 'package:rate_my_jerky/services/theme_service.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// A model that handles the [ViewState] and basic navigation.
///
class BaseModel extends Model {

  final navigationService = locator<NavigationService>();
  final themeService = locator<ThemeService>();

  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  void toggleTheme(BuildContext context) =>
      themeService.toggleTheme(context);
}
