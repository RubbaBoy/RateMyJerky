import 'package:flutter/material.dart';
import 'package:rate_my_jerky/service_locator.dart';
import 'package:rate_my_jerky/ui/views/home_view.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notedown',
      debugShowCheckedModeBanner: false,
      // https://github.com/flutter/flutter/issues/35826#issuecomment-559239389
      // theme: ThemeData.dark().copyWith(
      //   buttonTheme: const ButtonThemeData(minWidth: 12),
      //   splashColor: Colors.transparent,
      // ),
      home: HomeView(),
      // home: FutureBuilder(
      //   future: () {},
      //   // future: _memoizer.runOnce(() async => authService.trySilent().then((user) async {
      //   //   if (user == null) return null;
      //   //   await navigationService.getCachedCategories();
      //   //   return user;
      //   // })),
      //   builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.none:
      //       case ConnectionState.waiting:
      //         return Container(
      //             color: ThemeData.dark().scaffoldBackgroundColor,
      //             child: Center(child: CircularProgressIndicator()));
      //       default:
      //         if (snapshot.data == null) {
      //           return LoginView();
      //         } else {
      //           return NoteListView(NoteCategory.all);
      //         }
      //     }
      //   },
      // ),
    );
  }
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
