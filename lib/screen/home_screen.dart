import 'package:ad_ecom_ui/Home/little_single_product_view.dart';
import 'package:ad_ecom_ui/Home/single_list.dart';
import 'package:ad_ecom_ui/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/custom_container.dart';
import '../components/title_in_a_row.dart';
import '../constants/color.dart';
import '../providers/products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prodData = Provider.of<ProductData>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  elevation: 0,
                  child: const TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      fillColor: Colors.white,
                      hintText: 'Search Aesthestic Shirts',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: yellowDeep,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/filtered.png',
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomContainer(text: 'Woman'),
                CustomContainer(text: 'T-Shirt'),
                CustomContainer(text: 'Dress'),
                CustomContainer(text: 'Male'),
                CustomContainer(text: 'Children'),
                CustomContainer(text: 'Joggers'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          RowComponent(title: 'New Arrival'),
          const SizedBox(height: 10),
          Container(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prodData.newArrivals.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(DetailsScreen.routeName,
                      arguments: {'id': prodData.newArrivals[index].id});
                },
                child: SingleProductList(
                  id: prodData.newArrivals[index].id,
                  name: prodData.newArrivals[index].name,
                  imageAsset: prodData.newArrivals[index].imageUrl[0],
                  price: prodData.newArrivals[index].price,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          RowComponent(title: 'Best of Sales'),
          const SizedBox(height: 5),
          SingleChildScrollView(
            child: Container(
              height: 250,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                reverse: true,
                itemCount: prodData.availableProducts.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailsScreen.routeName,
                        arguments: {'id': prodData.availableProducts[index].id});
                  },
                  child: LittleSingleProduct(
                    id: prodData.availableProducts[index].id,
                    name: prodData.availableProducts[index].name,
                    imageAsset: prodData.availableProducts[index].imageUrl[0],
                    price: prodData.availableProducts[index].price,
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
