import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rxdart/rxdart.dart';

typedef CloseLoading = bool Function();
typedef UpdateLoading = bool Function(
    {String? text, String? iconPath, Widget? widget});

class LoadingController {
  final CloseLoading close;
  final UpdateLoading update;

  LoadingController({
    required this.close,
    required this.update,
  });
}

class Loading {
  static Loading? _singleton;
  factory Loading() {
    _singleton ??= Loading._();
    return _singleton!;
  }

  Loading._();

  static Future<void> precacheAssets(
      BuildContext context, String iconPath) async {
    final loader = SvgAssetLoader(iconPath);
    svg.cache
        .putIfAbsent(loader.cacheKey(context), () => loader.loadBytes(null));
    return;
  }

  LoadingController? _controller;
  void hide() {
    _controller?.close();
    _controller = null;
    return;
  }

  LoadingController? show({
    required BuildContext context,
    String? text,
    String? iconPath,
    Widget? widget,
  }) {
    if (_controller?.update(
          text: text,
          iconPath: iconPath,
          widget: widget,
        ) ??
        false) {
      return _controller;
    } else {
      _controller = showOverlay(
        context: context,
        text: text,
        iconPath: iconPath,
        widget: widget,
      );
    }
    return _controller;
  }

  LoadingController showOverlay({
    required BuildContext context,
    String? text,
    String? iconPath,
    Widget? widget,
  }) {
    final textStream = BehaviorSubject<String>.seeded(text ?? '');
    final iconPathStream = BehaviorSubject<String>.seeded(iconPath ?? '');
    final widgetStream =
        BehaviorSubject<Widget>.seeded(widget ?? const SizedBox.shrink());
    final overlayState = Overlay.of(context);

    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(builder: (context) {
      return Material(
        color: Colors.black.withAlpha(30),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: StreamBuilder<Widget>(
                    stream: widgetStream,
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data.runtimeType !=
                              const SizedBox.shrink().runtimeType) {
                        return snapshot.data!;
                      } else {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder<String>(
                                  stream: iconPathStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != '') {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        // Duration for the gradient change
                                        curve: Curves.bounceInOut,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.purple,
                                              Colors.deepPurple
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        padding:
                                            EdgeInsets.all(size.width * 0.02),
                                        child: SvgPicture.asset(
                                          snapshot.data ??
                                              'assets/common/icon.svg',
                                          semanticsLabel: 'Loading...',
                                          width: size.width * 0.1,
                                          matchTextDirection: true,
                                          height: size.height * 0.1,
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                              StreamBuilder<String>(
                                  stream: textStream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.data != '') {
                                      return Text.rich(
                                        TextSpan(
                                            semanticsLabel: snapshot.data,
                                            text: snapshot.data,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 102, 20, 102),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic)),
                                        textAlign: TextAlign.center,
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }),
                            ]);
                      }
                    })),
          ),
        ),
      );
    });
    overlayState.insert(overlay);
    return LoadingController(
      close: () {
        textStream.close();
        iconPathStream.close();
        widgetStream.close();
        overlay.remove();
        _controller = null;
        return true;
      },
      update: ({text, iconPath, widget}) {
        textStream.add(text ?? '');
        iconPathStream.add(iconPath ?? '');
        widgetStream.add(widget ?? const SizedBox.shrink());
        return true;
      },
    );
  }
}
