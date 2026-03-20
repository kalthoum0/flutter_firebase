import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;
}