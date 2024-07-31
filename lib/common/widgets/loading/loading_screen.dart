// import 'dart:async';
// import 'package:flutter/material.dart';

// import 'loading_screen_controller.dart';

// //@Singleton()
// class LoadingScreen {
//   LoadingScreen._sharedInstance();
//   static final LoadingScreen _shared = LoadingScreen._sharedInstance();
//   factory LoadingScreen.instance() => _shared;

//   LoadingScreenController? controller;

//   void show({
//     //make it like chain builder
//     required BuildContext context,
//     required String text,
//   })  {
//     if (controller?.update(text) ?? false) {
//       return;
//     } else {
//       controller = showOverlay(
//         context: context,
//         text: text,
//       );
//     }
//   }

//   hide() {
//     controller?.close();
//     controller = null;
//     return this; //make it like builder chain
//   }

//   LoadingScreenController showOverlay({
//     required BuildContext context,
//     required String text,
//   }) {
//     final text0 =
//         StreamController<String>(); // i am using rxdart package try using
//     text0.add(text);

//     final state = Overlay.of(context);
//     final renderBox = context.findRenderObject() as RenderBox;
//     final size = renderBox.size;

//     final overlay = OverlayEntry(
//       builder: (context) {
//         return Material(
//           color: Colors.black.withAlpha(150),
//           child: Center(
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: size.width * 0.8,
//                 maxHeight: size.height * 0.8,
//                 minWidth: size.width * 0.5,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       //add  icon parm for svg icon if that parm is not null then only
//                       const SizedBox(height: 10),
//                       const CircularProgressIndicator(),
//                       const SizedBox(height: 20),
//                       StreamBuilder(
//                         stream: text0.stream,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return Text(
//                               snapshot.data as String,
//                               textAlign: TextAlign.center,
//                             );
//                           } else {
//                             return Container();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     state.insert(overlay);

//     return LoadingScreenController(
//       close: () {
//         text0.close();
//         overlay.remove();
//         return true;
//       },
//       update: (text) {
//         text0.add(text);
//         return true;
//       },
//     );
//   }
// }

///////////////////////
///
///
///
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';

// class LoadingScreen {
//   LoadingScreen._sharedInstance();
//   static final LoadingScreen _shared = LoadingScreen._sharedInstance();
//   factory LoadingScreen.instance() => _shared;

//   LoadingScreenController? controller;

//   LoadingScreenController? show({
//     required BuildContext context,
//     required String text,
//   }) {
//     if (controller?.update(text) ?? false) {
//       return controller;
//     } else {
//       controller = showOverlay(
//         context: context,
//         text: text,
//       );
//     }
//     return controller; // Return the controller
//   }

//   void hide() {
//     controller?.close();
//     controller = null;
//   }

//   LoadingScreenController showOverlay({
//     required BuildContext context,
//     required String text,
//   }) {
//     final textStream = BehaviorSubject<String>.seeded(text);

//     final overlayState = Overlay.of(context);

//     final overlay = OverlayEntry(
//       builder: (context) {
//         return Material(
//           color: Colors.black.withAlpha(150), //keep it
//           child: Center(
//             child: Container(
//               constraints: const BoxConstraints(),
//               decoration: BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // const SizedBox(height: 10),
//                       const CircularProgressIndicator(),
//                       const SizedBox(height: 20),
//                       StreamBuilder<String>(
//                         stream: textStream,
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return Text(
//                               snapshot.data ?? '',
//                               textAlign: TextAlign.center,
//                             );
//                           } else {
//                             return Container();
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );

//     overlayState.insert(overlay);

//     return LoadingScreenController(
//       close: () {
//         textStream.close();
//         overlay.remove();
//         return true;
//       },
//       update: (text) {
//         textStream.add(text);
//         return true;
//       },
//     );
//   }
// }

// typedef CloseLoadingScreen = bool Function();
// typedef UpdateLoadingScreen = bool Function(String text);

// class LoadingScreenController {
//   final CloseLoadingScreen close;
//   final UpdateLoadingScreen update;

//   LoadingScreenController({
//     required this.close,
//     required this.update,
//   });
// }

///////////////////////
///
///
///
///
///
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum IconState { rotating, still }

class LoadingScreen {
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? controller;

  LoadingScreenController? show({
    required BuildContext context,
    required String text,
    String? iconPath,
    IconState iconState = IconState.rotating,
  }) {
    if (controller?.update(text, iconPath, iconState) ?? false) {
      return controller;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
        iconPath: iconPath,
        iconState: iconState,
      );
    }
    return controller;
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
    required String text,
    String? iconPath,
    IconState iconState = IconState.rotating,
  }) {
    final textStream = BehaviorSubject<String>.seeded(text);
    final iconStateStream = BehaviorSubject<IconState>.seeded(iconState);

    final overlayState = Overlay.of(context);

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                      // maxWidth: 300,
                      // maxHeight: 300,
                      // minWidth: 200,
                      ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    // borderRadius: BorderRadius.circular(10.0),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    // padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (iconPath != null) ...[
                            // const SizedBox(height: 10),
                            _DynamicSvgIcon(
                              iconPath: iconPath,
                              iconStateStream: iconStateStream,
                            ),
                            // const SizedBox(height: 20),
                          ],
                          // const CircularProgressIndicator(),
                          // const SizedBox(height: 20),
                          // StreamBuilder<String>(
                          //   stream: textStream,
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasData) {
                          //       return Text(
                          //         snapshot.data ?? '',
                          //         textAlign: TextAlign.center,
                          //       );
                          //     } else {
                          //       return Container();
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                ////
                ///
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: StreamBuilder<String>(
                    stream: textStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data ?? '',
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),

                ///
                //
              ],
            ),
          ),
        );
      },
    );

    overlayState.insert(overlay);

    return LoadingScreenController(
      close: () {
        textStream.close();
        iconStateStream.close();
        overlay.remove();
        return true;
      },
      update: (text, iconPath, iconState) {
        textStream.add(text);
        iconStateStream.add(iconState);
        return true;
      },
    );
  }
}

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(
    String text, String? iconPath, IconState iconState);

class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  LoadingScreenController({
    required this.close,
    required this.update,
  });
}

class _DynamicSvgIcon extends StatelessWidget {
  final String iconPath;
  final BehaviorSubject<IconState> iconStateStream;

  const _DynamicSvgIcon({
    Key? key,
    required this.iconPath,
    required this.iconStateStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<IconState>(
        stream: iconStateStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final iconState = snapshot.data!;
          switch (iconState) {
            case IconState.rotating:
              return _RotatingIcon(iconPath: iconPath);
            case IconState.still:
              return _StillIcon(iconPath: iconPath);
          }
        },
      ),
    );
  }
}

class _RotatingIcon extends StatefulWidget {
  final String iconPath;

  const _RotatingIcon({required this.iconPath});

  @override
  __RotatingIconState createState() => __RotatingIconState();
}

class __RotatingIconState extends State<_RotatingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SvgPicture.asset(
        widget.iconPath,
        width: 50,
        height: 50,
      ),
    );
  }
}

class _StillIcon extends StatelessWidget {
  final String iconPath;

  const _StillIcon({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: 50,
      height: 50,
    );
  }
}
