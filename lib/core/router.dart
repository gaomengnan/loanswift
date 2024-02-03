import 'package:flutter/material.dart';
import 'package:loanswift/common/page_404.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      debugPrint("default route");
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
