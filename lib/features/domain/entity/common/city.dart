import 'package:equatable/equatable.dart';


class City extends Equatable {
  final String? _name;
  final String? _code;
  final List<City>? _children;

  City({
    String? name,
    String? code,
    List<City>? children,
  })  : _name = name ?? '',
        _code = code ?? '',
        _children = children ?? [];

  // Getter methods with default values
  String get name => _name ?? '';
  String get code => _code ?? '';
  List<City> get children => _children ?? [];

  @override
  List<Object?> get props => [name, code, children];
}
