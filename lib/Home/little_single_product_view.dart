import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../providers/products.dart';

class LittleSingleProduct extends StatelessWidget {
  final int id;
  final String name;
  final String imageAsset;
  final double price;
  LittleSingleProduct({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var prodData = Provider.of<ProductData>(context);

    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Text(
                '\$${price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: yellowDeep,
                    fontSize: 18),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment(1.2, -2),
              child: CircleAvatar(
                backgroundColor: themeColor,
                child: IconButton(
                  onPressed: () {
                    prodData.toggleFav(id);
                  },
                  icon: Icon(
                    prodData.isFav(id) ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
