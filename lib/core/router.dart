import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/core/common/widgets/page_404.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/data/models/order_model.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/bloc/order/order_bloc.dart';
import 'package:loanswift/features/presentation/views/auth/auth_page.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/features/presentation/views/order/my_order.dart';
import 'package:loanswift/features/presentation/views/order/order_detail.dart';
import 'package:loanswift/features/presentation/views/order/repayment_page.dart';
import 'package:loanswift/features/presentation/views/person/bind_bank.dart';
import 'package:loanswift/features/presentation/views/person/verify_page.dart';
import 'package:loanswift/features/presentation/views/widgets/verification_code.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //case PermissionPage.routerName:
    //  return _pageBuilder(
    //    (_) => const PermissionPage(),
    //    settings: settings,
    //  );
    case BindBank.routerName:
      return _pageBuilder(
        (_) => const BindBank(),
        settings: settings,
      );

    case VerifyPage.routerName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (context) =>
              sl<CertifiesBloc>()..add(CertifiesSettingsLoadEvent()),
          child: const VerifyPage(),
        ),
        settings: settings,
      );

    case IndexPage.routerName:
      return _pageBuilder(
        (_) => const IndexPage(),
        settings: settings,
      );

    case AuthPage.routerName:
      return _pageBuilder(
        (_) => const AuthPage(),
        settings: settings,
      );

    case MyOrder.routerName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (context) => sl<OrderBloc>()
            ..add(OrderLoadEvent(
              orderStatus: OrderStatus.all,
            )),
          child: const MyOrder(),
        ),
        settings: settings,
      );

    case OrderDetail.routerName:
      final args = settings.arguments as Map<String, dynamic>;
      return _pageBuilder(
        (_) => BlocProvider(
          create: (context) => sl<OrderBloc>()
            ..add(
              OrderLoadDetailEvent(orderNo: args['order_no']),
            ),
          child: const OrderDetail(),
        ),
        settings: settings,
      );
    case RepaymentPage.routerName:
      return _pageBuilder(
        (_) => const RepaymentPage(),
        settings: settings,
      );
    case VerificationCodePage.routerName:
      return _pageBuilder(
        (_) => const VerificationCodePage(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (context, _, __) => page(context),
      transitionsBuilder: (
        _,
        animation,
        __,
        child,
      ) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuart;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      }
      //     FadeTransition(
      //   opacity: animation,
      //   child: child,
      // ),
      );
}
