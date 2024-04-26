import 'package:flutter/material.dart';

class CardListagemProduto extends StatelessWidget {
  final String descricaoProduto;

  const CardListagemProduto({Key? key, required this.descricaoProduto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      width: MediaQuery.of(context).size.width * 1,
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            const TextSpan(
                text: 'Descrição do Produto\n',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            TextSpan(text: descricaoProduto),
          ],
        ),
      ),
    );
  }
}
