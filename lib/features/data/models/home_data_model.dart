import 'dart:convert';

import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/features/domain/entity/home/other.dart';

HomeDataModel homeDataFromMap(String str) =>
    HomeDataModel.fromMap(json.decode(str));

String homeDataToMap(HomeDataModel data) => json.encode(data.toMap());

class HomeDataModel extends HomeData {
  HomeDataModel({
    required super.banners,
    required super.mainProducts,
    required super.apiProducts,
    required super.userOrders,
    required super.rules,
    required super.other,
  });

  HomeDataModel.empty()
      : this(
          banners: List<BannerEntity>.empty(),
          mainProducts: MainProducts.empty(),
          apiProducts: List<MainProducts>.empty(),
          userOrders: List<UserOrder>.empty(),
          rules: Rules.empty(),
          other: Other.empty(),
        );

  String toJson() => json.encode(toMap());

  factory HomeDataModel.fromJson(String source) =>
      HomeDataModel.fromMap(json.decode(source));

  factory HomeDataModel.fromMap(Map<String, dynamic> json) => HomeDataModel(
        banners: List<BannerEntity>.from(
            json["banners"].map((x) => BannerEntity.fromMap(x))),
        mainProducts: MainProducts.fromMap(json["main_products"] ?? {}),
        apiProducts: List<MainProducts>.from(
            json["api_products"].map((x) => MainProducts.fromMap(x))),
        userOrders: List<UserOrder>.from(
            json["user_orders"].map((x) => UserOrder.fromMap(x))),
        rules: Rules.fromMap(json["rules"] ?? {}),
        other: Other.fromMap(json["other"] ?? {}),
      );

  Map<String, dynamic> toMap() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toMap())),
        "main_products": mainProducts.toMap(),
        "api_products": List<dynamic>.from(apiProducts.map((x) => x)),
        "user_orders": List<dynamic>.from(userOrders.map((x) => x.toMap())),
        "rules": rules.toMap(),
        "other": other.toMap()
      };

  HomeData copyWith({
    List<BannerEntity>? banners,
    MainProducts? mainProducts,
    List<MainProducts>? apiProducts,
    List<UserOrder>? userOrders,
    Rules? rules,
    Other? other,
  }) =>
      HomeData(
        banners: banners ?? this.banners,
        mainProducts: mainProducts ?? this.mainProducts,
        apiProducts: apiProducts ?? this.apiProducts,
        userOrders: userOrders ?? this.userOrders,
        rules: rules ?? this.rules,
        other: other ?? this.other,
      );
}
