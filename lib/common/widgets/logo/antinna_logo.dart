// Copyright 2014 The Antinna Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:antinna/common/widgets/custom_painter/testhalf.dart';
import 'package:flutter/material.dart';

import 'flutter_logo.dart';

class AntinnaLogo extends StatefulWidget {
  const AntinnaLogo({
    super.key,
    this.size,
    this.textColor = const Color(0xFF757575),
    // this.style = AntinnaLogoStyle.markOnly,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.fastOutSlowIn,
  });

  final double? size;

  /// The color used to paint the "Antinna" text on the logo, if [style] is
  /// [AntinnaLogoStyle.horizontal] or [AntinnaLogoStyle.stacked].
  ///
  /// If possible, the default (a medium grey) should be used against a white
  /// background.
  final Color textColor;

  /// Whether and where to draw the "Antinna" text. By default, only the logo
  /// itself is drawn.
  // final AntinnaLogoStyle style;

  /// The length of time for the animation if the [style] or [textColor]
  /// properties are changed.
  final Duration duration;

  /// The curve for the logo animation if the [style] or [textColor] change.
  final Curve curve;

  @override
  State<AntinnaLogo> createState() => _AntinnaLogoState();
}

class _AntinnaLogoState extends State<AntinnaLogo> {
  late Timer _timer;
  late List<Color> _colors;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _index = (_index + 1) % _colors.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double? iconSize = widget.size ?? iconTheme.size;
    return AnimatedContainer(
      width: iconSize,
      height: iconSize,
      duration: widget.duration,
      curve: widget.curve,
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [
            _colors[_index % _colors.length],
            _colors[(_index + 3) % _colors.length]
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: CustomPaint(
        painter: RPSCustomPainter(
          color1: _colors[_index % _colors.length],
          color2: _colors[(_index + 1) % _colors.length],
          color3: _colors[(_index + 2) % _colors.length],
          color4: _colors[(_index + 3) % _colors.length],
        ),
      ),
      
    );
  }
}
