import 'package:flutter/material.dart';
import 'package:rate_my_jerky/enums/view_states.dart';
import 'package:rate_my_jerky/scoped_model/base_model.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/ui/widgets/busy_overlay.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final ScopedModelDescendantBuilder<T> _builder;
  final Function(T) onModelReady;
  final Function(T) onModelEnd;
  final Function(T) fabAdd;
  final bool showFab;

  BaseView(
      {GlobalKey<ScaffoldState> scaffoldKey,
      ScopedModelDescendantBuilder<T> builder,
      this.onModelReady,
      this.onModelEnd,
      this.fabAdd,
      this.showFab = true})
      : _scaffoldKey = scaffoldKey,
        _builder = builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T _model = locator<T>();
  ScopedModelDescendantBuilder<T> otherBuilder;

  @override
  void initState() {
    otherBuilder = (context, child, BaseModel model) => BusyOverlay(
          show: model.state == ViewState.Busy,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            key: widget._scaffoldKey,
            floatingActionButton: (!widget.showFab
                ? null
                : FloatingActionButton(
                    child: Icon(Icons.invert_colors),
                    onPressed: () => model.toggleTheme(context),
                  )),
            body: Builder(
                builder: (context) => SafeArea(
                      child: widget._builder(context, child, model),
                    )),
          ),
        );

    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.onModelEnd != null) {
      widget.onModelEnd(_model);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<T>(
        model: _model,
        child: ScopedModelDescendant<T>(
          child: Container(color: Colors.red),
          builder: otherBuilder,
        ));
  }

  Divider drawerSeparator() => Divider();

  ListTile drawerSectionTitle(BuildContext context, String name) => ListTile(
        isThreeLine: false,
        dense: true,
        title: Text(
          name,
          style: Theme.of(context).textTheme.subtitle,
        ),
      );

  ListTile drawerItem(BuildContext context, IconData icon, String name,
      {bool selected = false,
      int id = -1,
      Function() onTap,
      WidgetBuilder builder}) {
    return ListTile(
        leading: Icon(icon),
        title: Text(name),
        selected: _model.navigationService.selectedTab == id,
        onTap: () {
          Navigator.pop(context);
          if (onTap != null) {
            onTap();
          } else if (builder != null) {
            Navigator.push(context, MaterialPageRoute(builder: builder));
            if (id >= 0) {
              _model.navigationService.selectedTab = id;
            }
          }
        });
  }
}
