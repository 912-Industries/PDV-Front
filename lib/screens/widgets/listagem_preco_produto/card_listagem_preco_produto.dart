import 'package:flutter/material.dart';

class CardListagemPreco extends StatelessWidget {
  const CardListagemPreco({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
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
                            text: "Coca-Cola 1L\n",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: <TextSpan>[TextSpan(text: '11,99')],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
