import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final DateTime _time;
  final String _error;
  CustomError({
    required String message,
  })  : _error = message,
        _time = DateTime.now();

  String get error => _error;
  DateTime get time => _time;

  @override
  List<Object?> get props => [time, error];
}
