import 'package:flutter/material.dart';

import 'loading.dart';

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
  void initState() {
    // TODO: implement initState
    Loading.precacheAssets(context);
    super.initState();
  }

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
                final controller = Loading().show(
                  context: context,
                  text: "Loading...",
                  iconPath:
                      'assets/antinna.svg', // Optional: Path to your SVG asset
                  // iconState: IconState
                  //     .rotating, // Optional: Icon state, default is rotating
                );

// Update the icon or text later:
                Future.delayed(Duration(seconds: 1), () {
                  controller?.update(
                    "Still Loading...",
                    'assets/antinna.svg',
                  );
                });
// Or without changing the icon, just the text:
                Future.delayed(Duration(seconds: 2), () {
                  controller?.update(
                    "Almost done...",
                    null,
                  );
                });

                // Hide the loading screen after some delay
                Future.delayed(Duration(seconds: 4), () {
                  Loading().hide();
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
