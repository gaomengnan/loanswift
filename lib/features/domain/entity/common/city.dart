import 'package:equatable/equatable.dart';

class City extends Equatable {
  final String name;
  final String code;
  final List<City> children;

  const City({
    required this.name,
    required this.code,
    required this.children,
  });

  @override
  List<Object?> get props => [name, code, children];
}
