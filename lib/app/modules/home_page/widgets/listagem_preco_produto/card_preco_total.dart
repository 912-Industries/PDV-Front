import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/shared/product_presenter.dart';
import 'package:provider/provider.dart';

class CardPrecoTotal extends StatefulWidget {
  const CardPrecoTotal({super.key});

  @override
  State<CardPrecoTotal> createState() => _CardPrecoTotalState();
}

class _CardPrecoTotalState extends State<CardPrecoTotal> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final presenter = Provider.of<Presenter>(context, listen: false);
    presenter.calculateSubtotal();
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Presenter>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      height: 75,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Subtotal",
                style: TextStyle(
                    color: Color.fromARGB(255, 100, 27, 27),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 5),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                presenter.subtotal.toStringAsFixed(2),
                style: const TextStyle(
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
