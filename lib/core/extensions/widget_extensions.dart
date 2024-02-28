import 'package:flutter/material.dart';

extension ExpandedExtension on Widget {
  Expanded expanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }
}

extension AlignExtension on Widget {
  Align align({
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}

extension PaddingExtensions on Widget {
  // Padding with symmetrical padding
  Padding symmetricPadding({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  // Padding with EdgeInsets.all
  Padding allPadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  // Padding with EdgeInsets.only
  Padding onlyPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  // Padding with EdgeInsets.fromLTRB
  Padding fromLTRBPadding([
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  ]) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}
