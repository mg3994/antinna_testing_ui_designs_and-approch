import 'package:antinna/common/widgets/custom_painter/testhalf.dart';

import 'package:flutter/material.dart';

import 'common/widgets/logo/antinna_logo.dart';
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
    Loading.precacheAssets(context, 'assets/antinna.svg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Screen Demo'),
      ),
      body: CustomPaint(
        painter: RPSCustomPainter(),
        size: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AntinnaLogo(
                  // style: AntinnaLogoStyle.stacked, //will show the text bellow
                  // style: AntinnaLogoStyle.horizontal,
                  textColor: Colors.red,
                  duration: const Duration(seconds: 4),

                  curve: Curves.bounceIn,
                  size: 50,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final controller = Loading().show(
                      context: context,
                      // text: "Loading...",
                      // iconPath: 'assets/antinna.svg',
                      // widget: Center(child: Text("I am loading"))
                      // Optional: Path to your SVG asset
                      // iconState: IconState
                      //     .rotating, // Optional: Icon state, default is rotating
                    );
                    Future.delayed(Duration(seconds: 3), () {
                      controller?.update(
                          widget: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.yellow),
                              height: MediaQuery.of(context).size.height *
                                  0.4, //get it from diddepencechange
                              child: Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        controller.close();
                                      },
                                      child: Text("Close")),
                                  Expanded(
                                      child:
                                          Center(child: Text("I am loading"))),
                                ],
                              )));
                    });
                    // Update the icon or text later:
                    Future.delayed(Duration(seconds: 6), () {
                      controller?.update(
                        text: "Still Loading...",
                        iconPath: 'assets/antinna.svg',
                      );
                    });
                    // Or without changing the icon, just the text:
                    Future.delayed(Duration(seconds: 7), () {
                      controller?.update(
                        text: "Almost done...",
                      );
                    });

                    // Hide the loading screen after some delay
                    Future.delayed(Duration(seconds: 10), () {
                      Loading().hide();
                    });
                    controller?.close;
                  },
                  child: Text('Show Loading Screen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
