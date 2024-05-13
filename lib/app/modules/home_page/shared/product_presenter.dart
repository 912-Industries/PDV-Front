import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/widgets/dialog_produto/dialog_produto.dart';
import 'package:pdv_front/services/home_page/adicao_produto.dart';

class Presenter with ChangeNotifier {
  final _products = <Map<String, dynamic>>[];
  final _notifier = ValueNotifier(0);

  List<Map<String, dynamic>> get products => _products;

  double _subtotal = 0.0;
  double get subtotal => _subtotal;

  void addProduct(String productId) async {
    final produtoService = AdicaoProduto();
    final produto = await produtoService.fetchProdutoById(int.parse(productId));
    _products.add(produto);
    _calculateSubtotal();
    _notifier.value++;
    notifyListeners();
  }

  void removeProduct(String productId) {
    if (_products
        .any((product) => product['id_produto'] == int.parse(productId))) {
      _products.removeWhere(
          (product) => product['id_produto'] == int.parse(productId));
      _products.remove(productId);
      _calculateSubtotal();
      _notifier.value++;
      notifyListeners();
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

  void showAddConfirmationDialog(
      BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) => DialogProduto(
        onConfirm: (id) {
          addProduct(id);
        },
      ),
    );
  }

  void _calculateSubtotal() {
    _subtotal = 0.0;
    for (var product in _products) {
      _subtotal += product['precoFinal_produto'];
    }
  }

  void refresh() {
    notifyListeners();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  ValueNotifier<int> get listenable => _notifier;
}
