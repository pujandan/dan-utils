extension BooleanExtention on bool? {
  /// extention set default value [nullable]
  /// return if null replace to [value]
  bool nullable(bool value) => this ?? value;

  /// extention compare equalTo
  /// return [bool] == [value]
  bool equalTo(bool value) => nullable(false) == value;

  /// extention compare notEqualTo
  /// return [bool] != [value]
  bool notEqualTo(bool value) => nullable(false) != value;

  /// extention check value [bool]
  /// return is [true] or is [false]
  bool get isTrue {
    return (this == true) ? true : false;
  }

  /// extention check value [bool]
  /// return is [true] or is [false]
  bool get isFalse {
    return (this == false) ? true : false;
  }

  /// extention convert to [int]
  /// return 1 if [true] and 0 if [false]
  int get toInt {
    return (this == true) ? 1 : 0;
  }

  /// extention convert to [String]
  /// return "1" if [true] and "0" if [false]
  String get toStr {
    return (this == true) ? "1" : "0";
  }

  /// extention convert to [String]
  /// return [trueValue] if [true] or [falseValue] if [false]
  String toStringValue(String trueValue, String falseValue) {
    return nullable(false) ? trueValue : falseValue;
  }
}
