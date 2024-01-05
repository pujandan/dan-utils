extension DoubleExtention on double? {
  /// extention convert to [bool]
  /// return [true] if 1 and [false] if Other
  bool get isTrue {
    return (this == 1) ? true : false;
  }

  /// extention convert to [bool]
  /// return [true] if 1 and [false] if Other
  bool get isFalse {
    return (this != 1) ? true : false;
  }

  /// extention convert to [bool]
  /// return [true] if 1 and [false] if Other
  bool get toBool {
    return this == 1 ? true : false;
  }

  /// extention set default value [nullable]
  /// return if null replace to [value]
  double nullable(double value) => this ?? value;

  /// extention compare equalTo
  /// return [double] == [value]
  bool equalTo(double value) => this == value;

  /// extention compare notEqualTo
  /// return [double] =! [value]
  bool notEqualTo(double value) => this == value;

  /// extention compare greaterThan
  /// return [double] > [value]
  bool greaterThan(double value) => nullable(0) > value;

  /// extention compare greaterThanOrEqualTo
  /// return [double] >= [value]
  bool greaterThanOrEqualTo(double value) => nullable(0) >= value;

  /// extention compare lessThan
  /// return [double] < [value]
  bool lessThan(double value) => nullable(0) < value;

  /// extention compare lessThanOrEqualTo
  /// return [double] <= [value]
  bool lessThanOrEqual(double value) => (this ?? 0) <= value;

  /// extention compare equalIn
  /// where [In] List [double] == [values]
  bool equalIn(List<double> values) =>
      values.where((e) => e == this).isNotEmpty == true;

  /// extention compare notEqualIn
  /// where [NotIn] List [double] != [values]
  bool notEqualIn(List<double> values) =>
      values.where((e) => e != this).isNotEmpty == true;
}
