import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/ui/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  setupLocator();

  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(brightness: (prefs.getBool("isDark") ?? false) ? Brightness.dark: Brightness.light));
}

class MyApp extends StatelessWidget {

  final Brightness brightness;

  const MyApp({Key key, this.brightness}) : super(key: key);

  @override
  Widget build(BuildContext context) => DynamicTheme(
      defaultBrightness: brightness,
        data: (brightness) => ThemeData(brightness: brightness),
        themedWidgetBuilder: (context, theme) => MaterialApp(
        title: 'Rate My Jerky',
        debugShowCheckedModeBanner: false,
        // https://github.com/flutter/flutter/issues/35826#issuecomment-559239389
        theme: theme,
        home: HomeView(),
      ),
    );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
