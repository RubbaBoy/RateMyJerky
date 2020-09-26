import 'package:rate_my_jerky/enums/view_states.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/services/request_service.dart';

class RatingListViewModel extends BaseModel {
  static const ALL = 'All Locations';

  final requestService = locator<RequestService>();
  List<Review> reviews = [];

  String _location = ALL;

  String get location => _location;

  set location(String value) {
    _location = value;
    notifyListeners();
    refreshList();
  }

  void refreshList() {
    setState(ViewState.Busy);
    requestService
          .listReviews(location: _location == ALL ? null : _location)
          .then((reviews) {
        setState(ViewState.Retrieved);
        this.reviews = reviews;
        notifyListeners();
      });
  }
}
