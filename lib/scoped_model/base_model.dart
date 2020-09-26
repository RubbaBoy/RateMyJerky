import 'package:rate_my_jerky/enums/view_states.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/services/navigation_service.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// A model that handles the [ViewState] and basic navigation.
///
class BaseModel extends Model {

  NavigationService navigationService = locator<NavigationService>();

  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  String getStuff() => 'TODO';
}
