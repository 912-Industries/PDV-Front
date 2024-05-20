// presenter.dart
import 'package:flutter/material.dart';
import 'package:pdv_front/app/modules/home_page/widgets/dialog_produto/dialog_produto.dart';
import 'package:pdv_front/services/home_page/adicao_produto.dart';

class Presenter with ChangeNotifier {
  final _products = <Map<String, dynamic>>[];
  final _notifier = ValueNotifier(0);

  List<Map<String, dynamic>> get products => _products;
  late Map<String, dynamic> _lastAddedProduct;

  double _subtotal = 0.0;
  String _productDescription = '';

  double get subtotal => _subtotal;
  int get lastAddedProductQuantity => _lastAddedProduct['quantidade'] ?? '0';
  int get lastAddedProductId => _lastAddedProduct['id_produto'] ?? '0';
  num get lastAddedProductPrice =>
      _lastAddedProduct['precoFinal_produto'] ?? '0';
  String get productDescription => _productDescription;

  void addProduct(String productId) async {
    final produtoService = AdicaoProduto();
    final produto = await produtoService.fetchProdutoById(int.parse(productId));
    final existingProduct = _products.firstWhere(
        (p) => p['id_produto'] == produto['id_produto'] && p['quantidade'] > 0,
        orElse: () => {});

    if (existingProduct.isNotEmpty) {
      existingProduct['quantidade'] = (existingProduct['quantidade'] ?? 0) + 1;
      updateProductDescription();
    } else {
      produto['quantidade'] = 1;
      _products.add(produto);
    }

    _lastAddedProduct = existingProduct.isNotEmpty ? existingProduct : produto;

    _calculateSubtotalIndividual();
    calculateSubtotal();
    _notifier.value++;
    notifyListeners();
  }

  void updateProductDescription() {
    if (_products.isNotEmpty) {
      _productDescription = _products.last['nome_produto'];
    } else {
      _productDescription = '';
    }
    notifyListeners();
  }

  void removeProduct(String productId) {
    final productToRemove = _products.firstWhere(
      (product) => product['id_produto'] == int.parse(productId),
      orElse: () => {},
    );

    _updateProductQuantity(productToRemove, -1);
    _calculateSubtotalIndividual();
    updateProductDescription();
    calculateSubtotal();
    _notifier.value++;
    notifyListeners();
  }

  void _updateProductQuantity(Map<String, dynamic> product, int quantityDelta) {
    if (product['quantidade'] + quantityDelta > 0) {
      product['quantidade'] += quantityDelta;
    } else {
      _products.removeWhere((p) => p['id_produto'] == product['id_produto']);
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

  void _calculateSubtotalIndividual() {
    _subtotal = 0.0;
    for (var product in _products) {
      _subtotal += product['precoFinal_produto'];
    }
  }

  void calculateSubtotal() {
    _subtotal = 0.0;
    for (var product in _products) {
      _subtotal += product['precoFinal_produto'] * product['quantidade'];
    }
    notifyListeners(); // Notificar os listeners do presenter
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
