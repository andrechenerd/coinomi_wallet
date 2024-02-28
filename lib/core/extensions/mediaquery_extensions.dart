import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  double get screenH => MediaQuery.of(this).size.height;
  double get screenW => MediaQuery.of(this).size.width;
}