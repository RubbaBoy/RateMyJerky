import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/services/request_service.dart';
import 'package:rate_my_jerky/utility.dart';

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

  void refreshList() => requestService
          .listReviews(location: _location == ALL ? null : _location)
          .then((reviews) {
    print('reviews = $reviews');
        this.reviews = [...reviews, ...reviews, ...reviews];
        notifyListeners();
      });
}
