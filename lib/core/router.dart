import 'package:flutter/material.dart';
import 'package:loanswift/common/page_404.dart';
import 'package:loanswift/presentation/person/identity_verification.dart';

import '../presentation/index/index_page.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case IdentityVefification.routerName:
      return _pageBuilder(
        (_) => const IdentityVefification(),
        settings: settings,
      );

    case IndexPage.routerName:
      return _pageBuilder(
        (_) => const IndexPage(),
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
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
