import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    _focusNode.requestFocus(); // Requests focus for the widget
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
          if (event.isControlPressed &&
              event.logicalKey == LogicalKeyboardKey.keyD) {
            print('Ctrl+D was pressed');
          }
        }
      },
      child: const Text(''),
    );
  }
}
