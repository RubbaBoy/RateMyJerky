import 'package:barcode_scan/barcode_scan.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/utility.dart';

class RateModel extends BaseModel {

  int barcode;
  double rating = 0;

  Future<void> scanBarcode() async {
    var result = await BarcodeScanner.scan();

    if (result.type == ResultType.Barcode) {
      if ((barcode = result.rawContent.toInt()) != null) {
        notifyListeners();
      }
    }
  }

  void submitReview() => print('Submitting!');

}
