import 'package:flutter_test/flutter_test.dart';
import 'package:ml_reader/ml_reader.dart';
import 'package:ml_reader/ml_reader_platform_interface.dart';
import 'package:ml_reader/ml_reader_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMlReaderPlatform
    with MockPlatformInterfaceMixin
    implements MlReaderPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MlReaderPlatform initialPlatform = MlReaderPlatform.instance;

  test('$MethodChannelMlReader is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMlReader>());
  });

  test('getPlatformVersion', () async {
    MlReader mlReaderPlugin = MlReader();
    MockMlReaderPlatform fakePlatform = MockMlReaderPlatform();
    MlReaderPlatform.instance = fakePlatform;

    expect(await mlReaderPlugin.getPlatformVersion(), '42');
  });
}
