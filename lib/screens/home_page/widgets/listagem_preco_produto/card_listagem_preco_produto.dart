import 'package:flutter/material.dart';

class CardListagemPreco extends StatelessWidget {
  const CardListagemPreco({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 1,
      height: 105,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              RichText(
                text: const TextSpan(
                  text: "teste\n",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  children: <TextSpan>[TextSpan(text: 'testw')],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
