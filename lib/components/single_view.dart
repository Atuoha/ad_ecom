import 'package:ad_ecom_ui/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';



class SingleProductGrid extends StatelessWidget {
    final int id;
  final String name;
  final String imageAsset;
  final double price;
  SingleProductGrid({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    var prodData = Provider.of<ProductData>(context);

    return Container(
      // height: 180,
      // width: 210,
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  prodData.toggleFav(id);
                },
                icon: Icon(
                  prodData.isFav(id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$${price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: yellowDeep,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
