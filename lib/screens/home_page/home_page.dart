import 'package:flutter/material.dart';
import 'package:pdv_front/screens/home_page/widgets/listagem_preco_produto.dart';
import 'package:pdv_front/screens/home_page/widgets/listagem_produto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: const [
            ListagemProduto(),
            Spacer(),
            ListagemPrecoProduto(),
          ],
        ),
      ),
    );
  }
}
