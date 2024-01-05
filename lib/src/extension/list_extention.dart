extension ListExtention<T> on List<T>? {
  /// extention set default value [nullable]
  /// return if null replace to [values]
  List<T> nullable(List<T> values) => this ?? values;

  /// extention get length or maximal length
  /// return length of [List] if greaterThan [length]
  int length(int length) =>
      (nullable([]).length > length) ? length : nullable([]).length;
}
