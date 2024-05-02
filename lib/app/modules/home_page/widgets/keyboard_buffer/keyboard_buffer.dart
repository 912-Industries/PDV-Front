import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/deleteProductPresenter.dart';
import 'package:pdv_front/app/modules/home_page/widgets/dialog_produto/dialog_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/keyboard_buffer/keyboard_shortcuts.dart';
import 'package:provider/provider.dart';

class KeyboardBuffer extends StatefulWidget {
  final FocusNode focusNode;

  const KeyboardBuffer({required this.focusNode, super.key});

  @override
  State<KeyboardBuffer> createState() => _KeyboardBufferState();
}

class _KeyboardBufferState extends State<KeyboardBuffer> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);

    return Focus(
      autofocus: true,
      child: RawKeyboardListener(
        onKey: (RawKeyEvent event) {
          if (KeyboardShortcuts.isControlD(event)) {
            showDialog(
              context: context,
              builder: (context) => DialogProduto(
                onConfirm: (id) {
                  presenter.removeProduct(id);
                },
              ),
            );
          }
        },
        focusNode: widget.focusNode,
        child: const Text(''),
      ),
    );
  }
}
