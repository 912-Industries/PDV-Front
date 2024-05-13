import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_preco_produto/card_listagem_preco_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_preco_produto/card_preco_total.dart';

class ListagemPrecoProduto extends StatefulWidget {
  const ListagemPrecoProduto({super.key});

  @override
  State<ListagemPrecoProduto> createState() => _ListagemPrecoProdutoState();
}

class _ListagemPrecoProdutoState extends State<ListagemPrecoProduto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            CardListagemPreco(),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: CardPrecoTotal(),
            ),
          ],
        ),
      ),
    );
  }
}
