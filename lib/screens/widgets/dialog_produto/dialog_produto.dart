import 'dart:ui';

import 'package:flutter/material.dart';

class DialogProduto extends StatefulWidget {
  const DialogProduto({Key? key}) : super(key: key);

  @override
  State<DialogProduto> createState() => _DialogProdutoState();
}

class _DialogProdutoState extends State<DialogProduto> {
  final TextEditingController idProduto = TextEditingController();
  bool _showBackdropFilter = false;

  @override
  void initState() {
    super.initState();
    // Defina _showBackdropFilter como true após a primeira compilação do widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _showBackdropFilter = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Widget de fundo com BackdropFilter
          if (_showBackdropFilter) _BackdropFilterWidget(),

          // Centro do diálogo
          Center(
            child: AlertDialog(
              title: const Text('Informe o ID do Produto'),
              content: TextField(
                controller: idProduto,
                decoration: const InputDecoration(
                  hintText: "Digite o ID do produto",
                ),
                autofocus: true,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, idProduto.text),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// StatefulWidget para controlar manualmente a renderização do
class _BackdropFilterWidget extends StatefulWidget {
  @override
  _BackdropFilterWidgetState createState() => _BackdropFilterWidgetState();
}

class _BackdropFilterWidgetState extends State<_BackdropFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
