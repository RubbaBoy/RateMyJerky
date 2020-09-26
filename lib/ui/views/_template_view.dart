import 'package:flutter/material.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/ui/views/base_view.dart';

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<BaseModel>(
        builder: (context, child, model) => Scaffold(
              body: Center(
                child: Text(this.runtimeType.toString()),
              ),
            ));
  }
}
