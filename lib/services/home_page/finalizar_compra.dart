import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdv_front/app/modules/home_page/shared/product_presenter.dart';

class FinalizarCompraService {
  Presenter presenter = Presenter();
  Future<void> finalizarCompra(
      BuildContext context, List<Map<String, dynamic>> produtos) async {
    final produtosParaEnviar = produtos.map((produto) {
      return produto;
    }).toList();

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/api/produto/finalizar-compra'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(produtosParaEnviar),
      );

      if (response.statusCode == 200) {
        debugPrint('Compra finalizada com sucesso!');
      } else {
        throw http.ClientException(
            'Erro ao finalizar compra: ${response.statusCode}');
      }
    } catch (e) {
      if (e is http.ClientException) {
        if (e.message.contains('500')) {
          presenter.showError(context, null, 'Erro ao finalizar compra',
              'Algum produto consta como zerado no estoque');
        } else {
          presenter.showError(context, null, 'Erro ao finalizar compra',
              'Erro desconhecido: $e');
        }
      } else {
        presenter.showError(
            context, null, 'Erro ao finalizar compra', 'Erro desconhecido: $e');
      }
    }
  }
}
