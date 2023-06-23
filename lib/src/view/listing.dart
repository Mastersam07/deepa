import 'package:deepa/main.dart';
import 'package:flutter/material.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 300,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => routemaster.push('/product/${index + 1}'),
              child: Card(
                color: Colors.amber,
                child: Center(child: Text('${index + 1}')),
              ),
            );
          }),
    );
  }
}
