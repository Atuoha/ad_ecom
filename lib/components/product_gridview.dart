import 'package:ad_ecom_ui/components/single_view.dart';
import 'package:flutter/material.dart';

import '../screen/details.dart';

class ProductGridView extends StatelessWidget {
  final List products;
  ProductGridView({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: products
          .map(
            (prod) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(DetailsScreen.routeName,
                    arguments: {'id': prod.id});
              },
              child: SingleProductGrid(
                id: prod.id,
                name: prod.name,
                imageAsset: prod.imageUrl[0],
                price: prod.price,
              ),
            ),
          )
          .toList(),
    );
  }
}
