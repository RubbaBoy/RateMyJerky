import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rate_my_jerky/scoped_model/list_view_model.dart';
import 'package:rate_my_jerky/ui/views/base_view.dart';
import 'package:rate_my_jerky/utility.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RatingListViewState();
}

class RatingListViewState extends State<RatingListView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BaseView<RatingListViewModel>(
        onModelReady: (model) => model.refreshList(),
        builder: (context, child, model) => Column(
          children: [
            SizedBox(height: 15),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: RatingListViewModel.ALL,
                  elevation: 16,
                  onChanged: (value) => model.location = value,
                  items: [RatingListViewModel.ALL, ...LOCATIONS]
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: model.reviews
                    .map((review) => Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Card(
                            child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      // stars and place
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: SmoothStarRating(
                                            rating: review.stars,
                                            isReadOnly: true,
                                            size: 24,
                                            borderColor: Colors.orange,
                                            color: Colors.orange,
                                            filledIconData: Icons.star,
                                            halfFilledIconData: Icons.star_half,
                                            defaultIconData: Icons.star_border,
                                            starCount: 5,
                                            allowHalfRating: true,
                                            spacing: 2.0,
                                          ),
                                        ),
                                        Text(review.location),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(review.review)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      // upc and name
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${review.barcode}', style: textTheme.body1.copyWith(color: textTheme.caption.color)),
                                        Text('- ${review.name}', style: textTheme.caption),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      );
  }
}
