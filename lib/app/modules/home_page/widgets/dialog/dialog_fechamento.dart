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
    return const AlertDialog(
      title: Text('Finalizar Compra'),
      content: Text('Deseja finalizar a compra?'),
      actions: [
        Text('Cancelar'),
        Text('Confirmar'),
      ],
    );
  }
}
