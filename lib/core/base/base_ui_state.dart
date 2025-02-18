import 'package:equatable/equatable.dart';

abstract class BaseUiState extends Equatable {
  const BaseUiState({this.isLoading = false, this.userMessage});

  final bool isLoading;
  final String? userMessage;
}
