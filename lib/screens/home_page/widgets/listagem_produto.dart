import 'package:flutter/material.dart';

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
        width: 5,
        color: Colors.blue,
      )),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration:
                BoxDecoration(border: Border.all(width: 5, color: Colors.red)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
