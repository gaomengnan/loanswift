import 'package:loanswift/features/domain/entity/home/banner.dart';
import 'package:loanswift/features/domain/entity/home/other.dart';
import 'package:loanswift/features/domain/entity/products/main_products.dart';
import 'package:loanswift/features/domain/entity/home/rules.dart';
import 'package:loanswift/features/domain/entity/orders/user_order.dart';

class HomeData {
  final List<BannerEntity>? _banners;
  final MainProducts? _mainProducts;
  final List<MainProducts>? _apiProducts;
  final List<UserOrder>? _userOrders;
  final Rules? _rules;
  final Other? _other;

  HomeData({
    List<BannerEntity>? banners,
    MainProducts? mainProducts,
    List<MainProducts>? apiProducts,
    List<UserOrder>? userOrders,
    Rules? rules,
    Other? other,
  })  : _banners = banners,
        _mainProducts = mainProducts,
        _apiProducts = apiProducts,
        _userOrders = userOrders,
        _rules = rules,
        _other = other;

  HomeData.empty()
      : this(
          banners: List<BannerEntity>.empty(),
          mainProducts: MainProducts.empty(),
          apiProducts: List<MainProducts>.empty(),
          userOrders: List<UserOrder>.empty(),
          rules: Rules.empty(),
          other: Other.empty(),
        );

  // Getters with default values
  List<BannerEntity> get banners => _banners ?? [];
  MainProducts get mainProducts => _mainProducts ?? MainProducts.empty();
  List<MainProducts> get apiProducts => _apiProducts ?? [];
  List<UserOrder> get userOrders => _userOrders ?? [];
  Rules get rules => _rules ?? Rules.empty();
  Other get other => _other ?? Other.empty();
}
