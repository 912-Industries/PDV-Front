import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/deleteProductPresenter.dart';
import 'package:pdv_front/app/modules/home_page/widgets/keyboard_buffer/keyboard_buffer.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_descritivo_produto/listagem_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_preco_produto/listagem_preco_produto.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return ChangeNotifierProvider(
      create: (_) => Presenter(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const ListagemProduto(),
                  KeyboardBuffer(focusNode: _focusNode),
                  const Spacer(),
                  const ListagemPrecoProduto(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
