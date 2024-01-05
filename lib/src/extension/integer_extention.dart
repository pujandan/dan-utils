extension IntegerExtention on int? {
  /// extention convert to [bool]
  /// return [true] if 1 and [false] if other
  bool get isTrue {
    return (this == 1) ? true : false;
  }

  /// extention convert to [bool]
  /// return [true] if 1 and [false] if other
  bool get isFalse {
    return (this != 1) ? true : false;
  }

  /// extention convert to [bool]
  /// return [true] if 1 and [false] if other
  bool get toBool {
    return this == 1 ? true : false;
  }

  /// extention set default value [nullable]
  /// return if null replace to [value]
  int nullable(int value) => this ?? value;

  /// extention compare equalTo
  /// return [int] == [value]
  bool equalTo(int value) => this == value;

  /// extention compare notEqualTo
  /// return [int] =! [value]
  bool notEqualTo(int value) => this == value;

  /// extention compare greaterThan
  /// return [int] > [value]
  bool greaterThan(int value) => nullable(0) > value;

  /// extention compare greaterThanOrEqualTo
  /// return [int] >= [value]
  bool greaterThanOrEqualTo(int value) => nullable(0) >= value;

  /// extention compare lessThan
  /// return [int] < [value]
  bool lessThan(int value) => nullable(0) < value;

  /// extention compare lessThanOrEqualTo
  /// return [int] <= [value]
  bool lessThanOrEqual(int value) => (this ?? 0) <= value;

  /// extention compare equalIn
  /// where [in] List [int] == [values]
  bool equalIn(List<int> values) =>
      values.where((e) => e == this).isNotEmpty == true;

  /// extention compare notEqualIn
  /// where [not in] List [int] != [values]
  bool notEqualIn(List<int> values) =>
      values.where((e) => e != this).isNotEmpty == true;
}
