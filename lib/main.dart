import 'package:flutter/material.dart';
import 'common/widgets/loading/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Screen Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // LoadingScreenController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Screen Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                final controller = LoadingScreen.instance().show(
                  context: context,
                  text: "Loading...",
                  iconPath:
                      'assets/antinna.svg', // Optional: Path to your SVG asset
                  iconState: IconState
                      .rotating, // Optional: Icon state, default is rotating
                );

// Update the icon or text later:
                Future.delayed(Duration(seconds: 1), () {
                  controller?.update("Still Loading...", '', IconState.still);
                });
// Or without changing the icon, just the text:
                Future.delayed(Duration(seconds: 2), () {
                  controller?.update(
                      "Almost done...", null, IconState.rotating);
                });

                // Hide the loading screen after some delay
                Future.delayed(Duration(seconds: 4), () {
                  LoadingScreen.instance().hide();
                });
              },
              child: Text('Show Loading Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
