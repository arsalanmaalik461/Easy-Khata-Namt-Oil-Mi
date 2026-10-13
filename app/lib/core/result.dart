/// Simple result type for service-layer errors (no exceptions for domain failures).
sealed class Result<T> {
  const Result();
  bool get isOk => this is Ok<T>;
  bool get isErr => this is Err<T>;
  T get value => (this as Ok<T>).value;
  String get error => (this as Err<T>).message;
}

class Ok<T> extends Result<T> {
  final T value;
  const Ok(this.value);
}

class Err<T> extends Result<T> {
  final String message;
  const Err(this.message);
}

/// Stable unique IDs.
String newId() =>
    '${DateTime.now().microsecondsSinceEpoch.toRadixString(36)}${_counter++}';
int _counter = 0;
