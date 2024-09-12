import 'package:loanswift/features/domain/entity/home/banner.dart';
import 'package:loanswift/features/domain/entity/home/other.dart';
import 'package:loanswift/features/domain/entity/products/main_products.dart';
import 'package:loanswift/features/domain/entity/home/rules.dart';
import 'package:loanswift/features/domain/entity/orders/user_order.dart';

class HomeData {
  final List<BannerEntity> banners;
  final MainProducts mainProducts;
  final List<MainProducts> apiProducts;
  final List<UserOrder> userOrders;
  final Rules rules;

  final Other other;

  HomeData({
    required this.banners,
    required this.mainProducts,
    required this.apiProducts,
    required this.userOrders,
    required this.rules,
    required this.other,
  });

  HomeData.empty()
      : this(
          banners: List<BannerEntity>.empty(),
          mainProducts: MainProducts.empty(),
          apiProducts: List<MainProducts>.empty(),
          userOrders: List<UserOrder>.empty(),
          rules: Rules.empty(),
          other: Other.empty(),
        );
}
