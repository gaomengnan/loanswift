import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:loanswift/features/presentation/views/auth/auth_page.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/features/presentation/views/person/identity.dart';
import 'package:loanswift/features/presentation/views/person/my_order.dart';

import 'common/page_404.dart';
import 'core.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Identity.routerName:
      return _pageBuilder(
        (_) => const Identity(),
        settings: settings,
      );

    case IndexPage.routerName:
      return _pageBuilder(
        (_) => const IndexPage(),
        settings: settings,
      );

    case AuthPage.routerName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const AuthPage(),
        ),
        settings: settings,
      );

    case MyOrder.routerName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const AuthPage(),
        ),
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
