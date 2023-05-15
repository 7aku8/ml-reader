import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ml_reader_method_channel.dart';

abstract class MlReaderPlatform extends PlatformInterface {
  /// Constructs a MlReaderPlatform.
  MlReaderPlatform() : super(token: _token);

  static final Object _token = Object();

  static MlReaderPlatform _instance = MethodChannelMlReader();

  /// The default instance of [MlReaderPlatform] to use.
  ///
  /// Defaults to [MethodChannelMlReader].
  static MlReaderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MlReaderPlatform] when
  /// they register themselves.
  static set instance(MlReaderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
