import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/product_presenter.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_descritivo_produto/card_descritivo_produto.dart';
import 'package:pdv_front/app/modules/home_page/widgets/listagem_descritivo_produto/utils/card.dart';
import 'package:provider/provider.dart';

class ListagemProduto extends StatefulWidget {
  const ListagemProduto({super.key});

  @override
  State<ListagemProduto> createState() => _ListagemProdutoState();
}

class _ListagemProdutoState extends State<ListagemProduto> {
    String _descricaoProduto = '';

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);
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
      child: Column(
        children: [
          CardListagemProduto(
            descricaoProduto: _descricaoProduto,
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

  void _updateDescricaoProduto(String descricao) {
    setState(() {
      _descricaoProduto = descricao;
    });
  }
}
