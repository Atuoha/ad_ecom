import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_gridview.dart';
import '../providers/products.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favProducts = Provider.of<ProductData>(
      context,
      listen: false,
    ).favoriteList;

    return Consumer<ProductData>(
      builder: (context, prods, child) => prods.favoriteList.isEmpty
          ? Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/previews/004/968/488/original/add-to-favorite-list-concept-illustration-flat-design-eps10-simple-modern-graphic-element-for-landing-page-empty-state-ui-infographic-linear-icon-etc-vector.jpg',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Favorite List is Empty!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            )
          : ProductGridView(
              products: prods.favoriteList,
            ),
    );
  }
}
