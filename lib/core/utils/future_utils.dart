Future<T?> catchAndReturnFuture<T>(Future<T> future) async {
  try {
    return await future;
  } catch (e) {
    return null;
  }
}
