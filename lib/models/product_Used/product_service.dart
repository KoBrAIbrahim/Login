import 'product.dart';

class ProductService {
  final List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  void removeProduct(String name) {
    _products.removeWhere((product) => product.name == name);
  }

  List<Product> getProducts() {
    return _products;
  }

  Product? getProductById(int id) {
    return _products.firstWhere((product) => product.id == id, orElse: () => throw Exception("Product not found"));
  }
}
