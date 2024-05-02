import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/widgets/dialog_produto/dialog_produto.dart';

class Presenter with ChangeNotifier {
  final _products = <Map<String, dynamic>>[];

  Presenter() {
    _products.add({'id': 1, 'name': 'Coca-Cola', 'price': '1.99'});
    _products.add({'id': 2, 'name': 'Pepsi', 'price': '1.50'});
  }

  List<Map<String, dynamic>> get products => _products;

  void addProduct(Map<String, dynamic> product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(String productId) {
    print(_products);
    if (_products.any((product) => product['id'] == int.parse(productId))) {
      _products.removeWhere((product) => product['id'] == int.parse(productId));
      notifyListeners();
      print('deleteado $productId');
    } else {
      print('Produto não encontrado');
    }
  }

  void showConfirmationDialog(
      BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) => DialogProduto(
        onConfirm: (id) {
          removeProduct(id);
          refresh();
        },
      ),
    );
  }

  void refresh() {
    notifyListeners();
  }
}
