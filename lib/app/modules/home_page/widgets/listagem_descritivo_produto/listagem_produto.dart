import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_descritivo_produto/card_descritivo_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_descritivo_produto/utils/card.dart';

class ListagemProduto extends StatefulWidget {
  const ListagemProduto({super.key});

  @override
  State<ListagemProduto> createState() => _ListagemProdutoState();
}

class _ListagemProdutoState extends State<ListagemProduto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 1,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          CardListagemProduto(
            descricaoProduto: 'Coca-Cola 1L',
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: CardDescritivoProduto(
              id: 1,
              preco: 10.99,
              quantidade: 1,
              total: 10.99,
            ),
          ),
        ],
      ),
    );
  }
}

