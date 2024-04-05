import 'package:flutter/material.dart';

class CardListagemPreco extends StatelessWidget {
  const CardListagemPreco({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 1,
      height: 75,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(5)) ,
          child:  const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [Text('teste'),],),
          ],
          ),
    );
  }
}
