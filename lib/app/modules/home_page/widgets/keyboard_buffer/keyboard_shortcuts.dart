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
  static bool isControlEnter(RawKeyEvent event) {
    return event.isControlPressed &&
        event.logicalKey == LogicalKeyboardKey.enter;
  }
}
