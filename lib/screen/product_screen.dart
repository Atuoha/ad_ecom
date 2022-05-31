import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_gridview.dart';
import '../providers/products.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(
      builder: (context, prod, child) => ProductGridView(
        products: prod.availableProducts,
      ),
    );
  }
}
