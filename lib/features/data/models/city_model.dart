import 'package:loanswift/core/typedefs.dart';
import 'package:loanswift/features/domain/entity/common/city.dart';

List<CityModel> fetchCities(List<dynamic>? source) => source
    !.map(
      (item) => CityModel.fromMap(item as Map<String, dynamic>),
    )
    .toList();

class CityModel extends City {
  CityModel({
    required super.name,
    required super.code,
    required super.children,
  });

  factory CityModel.fromMap(DataMap map) {
    return CityModel(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      children: (map['listData'] as List<dynamic>?)
              ?.map((childMap) =>
                  CityModel.fromMap(childMap as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
