import 'package:flutter/services.dart';

int enterPressCount = 0;

class KeyboardShortcuts {
  static const int ctrlKey = 0x1;

  /// Hotkey para remover produto
  static bool isControlD(RawKeyEvent event) {
    return event.isControlPressed &&
        event.logicalKey == LogicalKeyboardKey.keyD;
  }

  /// Hotkey para adicionar produto
  static bool isControlA(RawKeyEvent event) {
    return event.isControlPressed &&
        event.logicalKey == LogicalKeyboardKey.keyA;
  }

  /// Hotkey para Finalizar Operação
  static bool isDoubleEnter(RawKeyEvent event) {
    if (event.logicalKey != LogicalKeyboardKey.enter) {
      enterPressCount = 0;
      return false;
    }

    enterPressCount++;
    if (enterPressCount == 2) {
      enterPressCount = 0;
      return true;
    }
    return false;
  }
}
