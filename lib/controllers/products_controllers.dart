import 'package:lesson46/models/product_model.dart';
import 'package:lesson46/services/products_http_service.dart.dart';

class ProductsControllers {
  final ProductsHttpService productsHttpService = ProductsHttpService();

  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProducts();
    return products;
  }
}
