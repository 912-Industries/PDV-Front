import 'dart:convert';
import 'package:http/http.dart' as http;

class AdicaoProduto {
  Future<Map<String, dynamic>> fetchProdutoById(int id) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/api/produto/$id'));

    if (response.statusCode == 200) {
      Map<String, dynamic> produto = json.decode(response.body);
      return produto;
    } else {
      throw Exception('Falha ao carregar produto');
    }
  }
}
