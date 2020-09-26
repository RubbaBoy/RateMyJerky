import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_jerky/scoped_model/rate_model.dart';
import 'package:rate_my_jerky/ui/views/base_view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RateViewState();
}

class RateViewState extends State<RateView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => BaseView<RateModel>(
        scaffoldKey: _scaffoldKey,
        showFab: false,
        builder: (context, child, model) => ListView(
          padding: EdgeInsets.all(20),
          children: [
            Center(
              child: Text('Rate some jerky',
                  style: Theme.of(context).textTheme.display1),
            ),
            SizedBox(height: 50),
            Card(
              elevation: 5,
              child: InkWell(
                child: Container(
                  child: model.barcode == null
                      ? Text('Tap to add a barcode!')
                      : Text('Barcode: ${model.barcode}'),
                  padding: EdgeInsets.all(25),
                ),
                onTap: () => model.scanBarcode(),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: SmoothStarRating(
                rating: model.rating,
                isReadOnly: false,
                size: 45,
                borderColor: Colors.orange,
                color: Colors.orange,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,
                onRated: (value) {
                  print("rating value -> $value");
                  // print("rating value dd -> ${value.truncate()}");
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  maxLines: 6,
                  decoration: InputDecoration.collapsed(
                      hintText:
                          'Give a little description of your jerky experience'),
                ),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              color: Theme.of(context).buttonColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text('Submit'),
              ),
              onPressed: () => model.submitReview(),
            )
          ],
        ),
      );
}