import 'package:flutter/material.dart';

class DialogProduto extends StatefulWidget {
  final Function(String) onConfirm;

  const DialogProduto({Key? key, required this.onConfirm}) : super(key: key);

  @override
  State<DialogProduto> createState() => _DialogProdutoState();
}

class _DialogProdutoState extends State<DialogProduto> {
  final TextEditingController idProduto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Informe o ID do Produto'),
      content: TextField(
        controller: idProduto,
        decoration: const InputDecoration(
          hintText: "Digite o ID do produto",
        ),
        autofocus: true,
        onSubmitted: (_) => _submit(context),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () => _submit(context),
          child: const Text('OK'),
        ),
      ],
    );
  }

  void _submit(BuildContext context) {
    widget.onConfirm(idProduto.text);
    Navigator.pop(context);
  }
}
