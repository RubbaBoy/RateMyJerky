import 'package:flutter/material.dart';
import 'package:rate_my_jerky/ui/views/rate_view.dart';
import 'package:rate_my_jerky/ui/views/rating_list_view.dart';

class NavigationService {
  int selectedTab = 0;

  void navTo(BuildContext context, WidgetBuilder builder) =>
      Navigator.push(context, MaterialPageRoute(builder: builder));

  void navToRating(BuildContext context) => navTo(context, (context) => RateView());

  void navToList(BuildContext context) => navTo(context, (context) => RatingListView());
}
