import 'package:flutter/material.dart';

class DialogProduto extends StatefulWidget {
  const DialogProduto({Key? key}) : super(key: key);

  @override
  State<DialogProduto> createState() => _DialogProdutoState();
}

class _DialogProdutoState extends State<DialogProduto> {
  final TextEditingController idProduto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Widget de fundo para preencher a tela
        Container(
          color: Colors.transparent,
        ),
        Builder(
          builder: (context) {
            Future<void> showTextInputDialog() async {
              await showDialog<String>(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
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
              );
            }

            showTextInputDialog(); // Mostrar o diálogo ao construir o widget

            return const SizedBox(); // Widget vazio, pois não queremos renderizar nada aqui
          },
        ),
      ],
    );
  }
}
