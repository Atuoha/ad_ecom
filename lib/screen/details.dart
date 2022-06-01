import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/color.dart';
import '../model/products.dart';
import '../providers/products.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = 'detials';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int activeSizeIndex = 0;
  int activeColorIndex = 0;

  List colors = [
    yellowDeep,
    Colors.red,
    Colors.pink,
    Colors.orange,
  ];

  Widget colorContainer(Color color, int indx) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeColorIndex = indx;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(bottom: 5),

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            activeColorIndex == indx
                ? BoxShadow(
                    color: color,
                    blurRadius: 5,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer,
                  )
                : const BoxShadow()
          ],
        ),
      ),
    );
  }

  List sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  Widget sizeContainer(String size, int indx) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeSizeIndex = indx;
        });
      },
      child: Container(
        height: 20,
        width: 50,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: indx == activeSizeIndex ? yellowLight : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            size,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: indx == activeSizeIndex ? yellowDeep : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    var prodData = Provider.of<ProductData>(context);
    Product product = prodData.findById(id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.chevron_left,
                    color: yellowDeep,
                  ),
                ),
              );
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.more_horiz,
                color: yellowDeep,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 450,
              child: Stack(
                children: [
                  PageIndicatorContainer(
                    indicatorSelectorColor: yellowDeep.withOpacity(0.3),
                    length: product.imageUrl.length,
                    child: PageView(
                      children: product.imageUrl
                          .map(
                            (image) => ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      height: 200,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      child:ListView.builder(
                        padding:EdgeInsets.only(top:10),
                      itemCount: colors.length,
                      itemBuilder: (context, index) => colorContainer(
                        colors[index],
                        index,
                      ),
                    ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
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
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_border,
                        color: yellowDeep,
                      ),
                      const SizedBox(width: 2),
                      Text(product.rating.toString())
                    ],
                  ),
                  const SizedBox(height: 20),
                  ReadMoreText(
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    product.description,
                    trimLines: 3,
                    colorClickableText: yellowDeep,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Read More',
                    trimExpandedText: ' Read Less ',
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) => sizeContainer(
                        sizes[index],
                        index,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: yellowDeep,
                          ),
                          child: TextButton(
                            onPressed: null,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
