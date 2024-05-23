import 'package:flutter/material.dart';

class DialogFinalizarCompra extends StatefulWidget {
  final List<Map<String, dynamic>> produtos;
  final Function(List<Map<String, dynamic>>) onConfirm;

  const DialogFinalizarCompra(
      {Key? key, required this.produtos, required this.onConfirm})
      : super(key: key);

  @override
  State<DialogFinalizarCompra> createState() => _DialogFinalizarCompraState();
}

class _DialogFinalizarCompraState extends State<DialogFinalizarCompra> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Finalizar Compra'),
      content: const Text('Deseja finalizar a compra?'),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Confirmar'),
          onPressed: () {
            widget.onConfirm(widget.produtos);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
