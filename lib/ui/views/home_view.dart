import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/scoped_model/home_model.dart';
import 'package:rate_my_jerky/ui/views/base_view.dart';


class HomeView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => BaseView<HomeModel>(
        builder: (context, child, model) => Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Rate My Jerky', style: Theme.of(context).textTheme.display2),
                SizedBox(height: 75),
                RaisedButton(
                  child: Text('I\'m hungry, bro'),
                  padding: EdgeInsets.all(15),
                  onPressed: () => model.onHungry(context),
                ),
                SizedBox(height: 25),
                RaisedButton(
                  child: Text('Rate some jerky'),
                  padding: EdgeInsets.all(15),
                  onPressed: () => model.onRate(context),
                ),
              ],
            ),
          ),
        ),
      );
}
