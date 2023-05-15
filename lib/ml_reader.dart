
import 'ml_reader_platform_interface.dart';

class MlReader {
  Future<String?> getPlatformVersion() {
    return MlReaderPlatform.instance.getPlatformVersion();
  }
}
