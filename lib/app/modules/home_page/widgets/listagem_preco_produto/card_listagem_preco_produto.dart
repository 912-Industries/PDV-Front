import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/product_presenter.dart';
import 'package:provider/provider.dart';

class CardListagemPreco extends StatefulWidget {
  const CardListagemPreco({Key? key}) : super(key: key);

  @override
  _CardListagemPrecoState createState() => _CardListagemPrecoState();
}

class _CardListagemPrecoState extends State<CardListagemPreco> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: presenter.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: 105,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ID: ${presenter.products[index]['id_produto']}\nProduto: ${presenter.products[index]['nome_produto']}\nPreço: ${presenter.products[index]['precoFinal_produto']}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
