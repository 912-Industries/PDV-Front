import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardBuffer extends StatefulWidget {
  const KeyboardBuffer({super.key});

  @override
  State<KeyboardBuffer> createState() => _KeyboardBufferState();
}

FocusNode _focusNode = FocusNode();

class _KeyboardBufferState extends State<KeyboardBuffer> {
  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus(); // Solicita o foco para o widget
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          print('Tecla pressionada: ${event.logicalKey}');
        }
      },
      child: const Text(''),
    );
  }
}
