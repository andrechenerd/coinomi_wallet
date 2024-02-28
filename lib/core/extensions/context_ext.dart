import 'package:flutter/material.dart';


extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  void hideKeyboard() {
    final focusNode = FocusScope.of(this);
    if (!focusNode.hasPrimaryFocus) {
      focusNode.unfocus();
    }
  }



  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom != 0;
  bool get hasOverlay => ModalRoute.of(this)?.isCurrent != true;
  Size get screenSize => MediaQuery.of(this).size;
  double get topMargin => MediaQuery.of(this).padding.top;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
}
