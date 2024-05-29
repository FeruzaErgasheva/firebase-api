import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson46/models/product_model.dart';

class ProductsHttpService {
  Future<List<Product>> getProducts() async {
    Uri uri = Uri.parse(
        "https://lesson46-746af-default-rtdb.firebaseio.com/products.json");
    try {
      final response = await http.get(uri);
      final data = jsonDecode(response.body);

      List<Product> loadedProducts = [];
      if (data != null) {
        data.forEach((key, value) {
          loadedProducts.add(Product.fromJson(value));
        });
      }
      return loadedProducts;
    } catch (e) {
      print(e);
    }
    return [];
  }
}

// void main(List<String> args) {
//   ProductsHttpService productsHttpService = ProductsHttpService();
//   productsHttpService.getProducts();
// }
