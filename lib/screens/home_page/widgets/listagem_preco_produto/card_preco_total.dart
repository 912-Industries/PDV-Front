import 'package:flutter/material.dart';

class CardPrecoTotal extends StatefulWidget {
  const CardPrecoTotal({super.key});

  @override
  State<CardPrecoTotal> createState() => _CardPrecoTotalState();
}

class _CardPrecoTotalState extends State<CardPrecoTotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      height: 75,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Subtotal",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15, bottom: 5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "10,99",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
