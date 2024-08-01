import 'package:flutter/services.dart';

extension LocalFileData on String {
  /// ```dart
  /// void testIt() async {
  ///   (await 'images/template.png'.localFileData());
  /// }
  /// ```

  Future<Uint8List> localFileData() => rootBundle.load(this).then(
        (byteData) => byteData.buffer.asUint8List(),
      );
}
