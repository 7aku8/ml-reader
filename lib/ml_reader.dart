
import 'ml_reader_platform_interface.dart';

class MlReader {
  Future<String?> getPlatformVersion() {
    return MlReaderPlatform.instance.getPlatformVersion();
  }

  Future<String?> scanImage() async {
    final String? result = await MlReaderPlatform.instance.scanImage();

    final cardReg = RegExp(r"^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$");

    if (result != null) {
      final cardRegMatch = cardReg.firstMatch(result);

      if (cardRegMatch != null) {
        print('have a match!');
        print(cardRegMatch[0]);
      } else {
        print('no matches!');
      }
    }

    return result;
  }
}
