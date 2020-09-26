import 'package:barcode_scan/barcode_scan.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/services/request_service.dart';
import 'package:rate_my_jerky/utility.dart';

class RateModel extends BaseModel {

  final requestService = locator<RequestService>();

  int barcode;
  String name;
  double rating = 0;
  String review;

  String _location = DEFAULT_LOCATION;

  String get location => _location;

  set location(String value) {
    _location = value;
    notifyListeners();
  }

  Future<void> scanBarcode() async {
    var result = await BarcodeScanner.scan();

    if (result.type == ResultType.Barcode) {
      if ((barcode = result.rawContent.toInt()) != null) {
        notifyListeners();
      }
    }
  }

  void submitReview() => requestService.writeReview(Review(name, barcode, _location, rating, review))
      .then((_) {
        Fluttertoast.showToast(msg: 'Thanks for the review, $name');
        barcode = null;
        rating = 0;
        review = null;
        _location = DEFAULT_LOCATION;
      });

}
