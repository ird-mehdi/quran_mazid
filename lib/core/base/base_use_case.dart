import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quran_mazid_app/core/utils/logger_utility.dart';
import 'package:quran_mazid_app/domain/service/error_message_handler.dart';

abstract class BaseUseCase<T> {
  BaseUseCase(this._errorMessageHandler);

  final ErrorMessageHandler _errorMessageHandler;

  @protected
  Future<Either<String, T>> mapResultToEither(
    FutureOr<T> Function() function,
  ) async {
    try {
      final T result = await function();
      return right(result);
    } catch (error, stack) {
      logError(error);
      logError(stack);
      final String errorMessage = _errorMessageHandler.generateErrorMessage(
        error,
      );
      return left(errorMessage);
    }
  }

  @protected
  Future<T> getRight(FutureOr<T> Function() function) async {
    final Either<String, T> result = await mapResultToEither(() => function());
    return result.getRight().getOrElse(
      () => throw Exception('No successful result available'),
    );
  }

  @protected
  Future<void> doVoid(FutureOr<T> Function() function) async {
    await mapResultToEither(() => function());
  }
}
