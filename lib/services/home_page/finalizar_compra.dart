import 'dart:convert';

import 'package:http/http.dart' as http;

class FinalizarCompraService {
  Future<void> finalizarCompra(List<Map<String, dynamic>> produtos) async {
    final produtosParaEnviar = produtos.map((produto) {
      return {"id_produto": produto["id"], "quantidade": produto["quantidade"]};
    }).toList();

    final response = await http.post(
      Uri.parse('http://localhost:8080/api/produto/finalizar-compra'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(produtosParaEnviar),
    );

    if (response.statusCode == 200) {
      // Sucesso! A compra foi finalizada com sucesso.
      print('Compra finalizada com sucesso!');
    } else {
      print('Erro desconhecido. Código de status: ${response.statusCode}');
    }
  }
}