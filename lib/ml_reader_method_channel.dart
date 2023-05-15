import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ml_reader_platform_interface.dart';

/// An implementation of [MlReaderPlatform] that uses method channels.
class MethodChannelMlReader extends MlReaderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ml_reader');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> scanImage() async {
    final recognized = await methodChannel.invokeMethod<String?>('scanImage');

    print(recognized);

    return recognized;
  }
}
