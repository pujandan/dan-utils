import 'dart:io';

import 'package:dan_utils/dan_utils.dart';

class Env {
  static final Env _singleton = Env._internal();

  factory Env() {
    return _singleton;
  }

  Map<String, String> env = <String, String>{};

  Env._internal();

  void load({File? file}) {
    if (env.isEmpty) {
      env = _loadEnv(file: file);
    }
  }

  /// get env value
  /// ```
  /// with check Platform.environment
  /// Evn.get('APP_KEY');
  /// Evn.get('APP_KEY', 'with_default_value_if_null');
  /// ```
  static String get(String key, [String? defaultValue]) {
    String value = Env().env[key].toString();
    String? valueInPlatform = Platform.environment[key];
    return valueInPlatform.nullable(
        value.isEmpty || value.toLowerCase() == 'null'
            ? defaultValue.nullable("")
            : value);
  }

  /// load env from .env of project directory
  Map<String, String> _loadEnv({File? file}) {
    Map<String, String> data = <String, String>{};

    File envFile = file ?? File('${Directory.current.path}/.env');
    String contents = envFile.readAsStringSync();

    // splitting with new line for each variables
    List<String> list = contents.split('\n');

    for (String d in list) {
      // splitting with equal sign to get key and value
      List<String> keyValue = d.toString().split('=');
      if (keyValue.first.isNotEmpty) {
        data[keyValue.first.trim()] = _getValue(keyValue);
      }
    }

    return data;
  }

  String _getValue(List<String> elements) {
    if (elements.length > 1) {
      List<String> elementsExceptFirst = elements.sublist(1);
      String value = elementsExceptFirst.join('=');
      return value
          .replaceAll('"', '')
          .replaceAll("'", '')
          .replaceAll('`', '')
          .trim();
    }
    return '';
  }
}
