import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_gridview.dart';
import '../providers/products.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductGridView(
      products: Provider.of<ProductData>(
        context,
        listen: false,
      ).favoriteList,
    );
  }
}
