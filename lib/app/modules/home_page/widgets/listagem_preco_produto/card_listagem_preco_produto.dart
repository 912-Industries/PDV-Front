import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/deleteProductPresenter.dart';
import 'package:pdv_front/app/modules/home_page/widgets/dialog_produto/dialog_produto.dart';
import 'package:provider/provider.dart';

class CardListagemPreco extends StatefulWidget {
  const CardListagemPreco({Key? key}) : super(key: key);

  @override
  _CardListagemPrecoState createState() => _CardListagemPrecoState();
}

class _CardListagemPrecoState extends State<CardListagemPreco> {
  List<Map<String, dynamic>> products = [
    {'id': '1', 'name': 'Coca-Cola', 'price': '1.99'},
    {'id': '2', 'name': 'Pepsi', 'price': '1.50'},
  ];

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: presenter.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                showConfirmationDialog(presenter.products[index]);
              },
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
                      'ID: ${products[index]['id']}\nProduto: ${products[index]['name']}\nPreço: ${products[index]['price']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showConfirmationDialog(Map<String, dynamic> product) {
    final presenter = Provider.of<Presenter>(context, listen: false);
    DialogProduto(
      onConfirm: (id) {
        presenter.removeProduct(id);
      },
    );
    showDialog(
      context: context,
      builder: (context) => DialogProduto(
        onConfirm: (id) {
          presenter.removeProduct(id);
          presenter.refresh();
        },
      ),
    );
  }
}
