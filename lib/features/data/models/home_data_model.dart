import 'dart:convert';

import 'package:loanswift/features/domain/entity/entity.dart';

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
  });

  HomeDataModel.empty()
      : this(
          banners: List<BannerEntity>.empty(),
          mainProducts: MainProducts.empty(),
          apiProducts: List<MainProducts>.empty(),
          userOrders: List<UserOrder>.empty(),
          rules: Rules.empty(),
        );

  factory HomeDataModel.fromMap(Map<String, dynamic> json) => HomeDataModel(
        banners:
            List<BannerEntity>.from(json["banners"].map((x) => BannerEntity.fromMap(x))),
        mainProducts: MainProducts.fromMap(json["main_products"]),
        apiProducts: List<MainProducts>.from(
            json["api_products"].map((x) => MainProducts.fromMap(x))),
        userOrders: List<UserOrder>.from(
            json["user_orders"].map((x) => UserOrder.fromMap(x))),
        rules: Rules.fromMap(json["rules"]),
      );

  Map<String, dynamic> toMap() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toMap())),
        "main_products": mainProducts.toMap(),
        "api_products": List<dynamic>.from(apiProducts.map((x) => x)),
        "user_orders": List<dynamic>.from(userOrders.map((x) => x.toMap())),
        "rules": rules.toMap(),
      };

  HomeData copyWith({
    List<BannerEntity>? banners,
    MainProducts? mainProducts,
    List<MainProducts>? apiProducts,
    List<UserOrder>? userOrders,
    Rules? rules,
  }) =>
      HomeData(
        banners: banners ?? this.banners,
        mainProducts: mainProducts ?? this.mainProducts,
        apiProducts: apiProducts ?? this.apiProducts,
        userOrders: userOrders ?? this.userOrders,
        rules: rules ?? this.rules,
      );
}