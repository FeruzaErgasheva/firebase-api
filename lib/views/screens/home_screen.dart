import 'package:flutter/material.dart';
import 'package:lesson46/controllers/products_controllers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ProductsControllers productsControllers = ProductsControllers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: productsControllers.getProducts(),

          ///snapshot bu malumot
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Mahsulotlar mavjud emas"),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            final products = snapshot.data;
            return products == null || products.isEmpty
                ? const Center(
                    child: Text("Mahsulotlar mavjud emas"),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product=products[index];
                      return ListTile(
                        title:  Text(product.title),
                        subtitle:  Text("\$${product.price}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      );
                    });
          }),
    );
  }
}
