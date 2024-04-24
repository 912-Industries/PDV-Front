import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdv_front/screens/widgets/dialog_produto/dialog_produto.dart';
import 'package:pdv_front/screens/widgets/keyboard_buffer/keyboard_shortcuts.dart';

class KeyboardBuffer extends StatefulWidget {
  const KeyboardBuffer({Key? key}) : super(key: key);

  @override
  State<KeyboardBuffer> createState() => _KeyboardBufferState();
}

class _KeyboardBufferState extends State<KeyboardBuffer> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          if (KeyboardShortcuts.isDoubleEnter(event)) {
            print('double enter');
          }
          if (KeyboardShortcuts.isControlD(event)) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DialogProduto())); // Navigate to DialogProduto
          }
        }
      },
      child: const Text(''),
    );
  }
}
