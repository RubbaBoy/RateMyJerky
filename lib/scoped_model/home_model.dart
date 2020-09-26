import 'package:flutter/cupertino.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';

class HomeModel extends BaseModel {

  void onHungry(BuildContext context) {
    print('Hungry');
  }

  void onRate(BuildContext context) =>
      navigationService.navToRating(context);
}
