import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdv_front/app/modules/home_page/shared/deleteProductPresenter.dart';
import 'package:pdv_front/app/modules/home_page/widgets/dialog_produto/dialog_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/keyboard_buffer/keyboard_shortcuts.dart';
import 'package:provider/provider.dart';

class KeyboardBuffer extends StatelessWidget {
  const KeyboardBuffer({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);
    final FocusNode focusNode = FocusNode();

    return RawKeyboardListener(
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          if (KeyboardShortcuts.isControlD(event)) {
            focusNode.requestFocus();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DialogProduto(
                  onConfirm: (id) {
                    presenter.removeProduct(id);
                  },
                ),
              ),
            );
          }
        }
      },
      focusNode: focusNode,
      child: const Text(''),
    );
  }
}
