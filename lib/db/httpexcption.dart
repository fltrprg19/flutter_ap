class httpexc implements Exception {
  final String message;

  httpexc(this.message);

  @override
  String toString() {
    return message;
  }
}
