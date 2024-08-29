import 'package:loanswift/features/domain/entity/home/banner.dart';
import 'package:loanswift/features/domain/entity/home/main_products.dart';
import 'package:loanswift/features/domain/entity/home/rules.dart';
import 'package:loanswift/features/domain/entity/home/user_order.dart';

class HomeData {
  final List<Banner> banners;
  final MainProducts mainProducts;
  final List<MainProducts> apiProducts;
  final List<UserOrder> userOrders;
  final Rules rules;

  HomeData({
    required this.banners,
    required this.mainProducts,
    required this.apiProducts,
    required this.userOrders,
    required this.rules,
  });

  HomeData.empty()
      : this(
          banners: List<Banner>.empty(),
          mainProducts: MainProducts.empty(),
          apiProducts: List<MainProducts>.empty(),
          userOrders: List<UserOrder>.empty(),
          rules: Rules.empty(),
        );
}
