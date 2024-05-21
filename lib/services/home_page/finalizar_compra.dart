import 'dart:convert';

import 'package:http/http.dart' as http;

class FinalizarCompraService {
  Future<void> finalizarCompra(List<Map<String, dynamic>> produtos) async {
    final response = await http.post(
      Uri.parse('https://seu-backend.com/remover-produtos'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(produtos),
    );

    if (response.statusCode == 200) {
      // Remoção realizada com sucesso
    } else {
      // Erro ao remover produtos
    }
  }
}
