import 'package:flutter/material.dart';

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
      decoration:
          BoxDecoration(border: Border.all(width: 5, color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.36,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.black)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.36,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.purple)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
