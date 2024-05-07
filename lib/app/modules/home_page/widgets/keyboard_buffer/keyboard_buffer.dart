import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/product_presenter.dart';
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
          if (KeyboardShortcuts.isControlA(event)) {
            showDialog(
                context: context,
                builder: (context) => DialogProduto(onConfirm: (id) {
                      presenter.addProduct(id);
                    }));
          }
          if (KeyboardShortcuts.isDoubleEnter(event)) {
          /// TODO Adicionar comportamento
          }
        },
        focusNode: widget.focusNode,
        child: const Text(''),
      ),
    );
  }
}
