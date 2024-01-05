extension StringExtension on String? {
  /// method is to [capitalize] text
  String toCapitalize() {
    return nullable("").isEmpty
        ? ""
        : "${nullable("")[0].toUpperCase()}${nullable("").substring(1)}";
  }

  /// method is to [camelcase] text
  String toCamelCase() {
    return nullable("").isEmpty
        ? ""
        : nullable("")
            .toLowerCase()
            .replaceAll(RegExp(" +"), " ")
            .split(" ")
            .map((str) => str.toCapitalize)
            .join(" ");
  }

  /// extention is clear [emoticon]
  String clearEmoticon() {
    if (this == null) {
      return "";
    } else {
      return nullable("").replaceAll(
          RegExp(
              '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
          '');
    }
  }

  /// extention set default value [nullable]
  /// return if null replace to [value]
  String nullable(String value) => this ?? value;

  /// extention compare equalTo
  /// return [String] == [value]
  bool equalTo(String value) => this == value;

  /// extention compare notEqualTo
  /// return [String] != [value]
  bool notEqualTo(String value) => this != value;

  /// extention parse toDouble
  /// return [double] with [tryParse] and [replaceAll] other number
  double get toDouble =>
      double.tryParse(nullable("0").replaceAll(RegExp(r'[^0-9]'), "")) ?? 0;

  /// extention parse toDouble
  /// return [int] with [tryParse] and [replaceAll] other number
  int get toInteger =>
      int.tryParse(nullable("0").replaceAll(RegExp(r'[^0-9]'), "")) ?? 0;
}
