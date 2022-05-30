import 'package:flutter/cupertino.dart';
import '../model/products.dart';

class ProductData extends ChangeNotifier {
  Product findById(int id) {
    return availableProducts.firstWhere((product) => product.id == id);
  }

  void toggleFav(int id) {
    Product favProduct =
        availableProducts.firstWhere((product) => product.id == id);
    if (isFav(id)) {
      // remove
      favoriteList.remove(favProduct);
      print('REMOVING');
    } else {
      // add
      favoriteList.add(favProduct);
      print('ADDING');
    }
    notifyListeners();
  }

  bool isFav(int id) {
    return favoriteList.any((product) => product.id == id);
  }

  List favoriteList = [];

  List availableProducts = [
    Product(
      id: 1,
      name: 'Gucci Oversize Hoodie',
      rating: 4.7,
      description:
          'Gucci Oversize Hoodie is a stylish wear designed for both male and female with patterns silked with soft fabrics and thread. It can be worn with Joggers, or anything fancy ',
      imageUrl: [
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/arrival1.png',
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/detail2.png'
      ],
      price: 79.99,
    ),
    Product(
      id: 2,
      name: 'Man Coat Rain Jacket',
      rating: 4.7,
      description:
          'Man Coat Rain Jacket is a stylish wear designed for males patterns silked with soft fabrics and thread. It can be worn with Joggers, or anything fancy ',
      imageUrl: [
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/arrival2.png',
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/detail3.png'
      ],
      price: 90.15,
    ),
    Product(
      id: 28,
      name: 'Male White Top',
      rating: 5,
      description:
          'Buy Men\'s White Shirts Online. Enjoy safe shopping online with Jumia. ✓Best Price in Nigeria ✓Fast Delivery & Cash on delivery Available',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/young-black-man-pointing-at-blank-space-of-his-clothes-picture-id1169954933?b=1&k=20&m=1169954933&s=170667a&w=0&h=dobSJp5q1Sl1RlrbZRJqPIyA1LBM8cg8xoIsIFm6z0U=',
        'https://media.istockphoto.com/photos/close-up-photo-of-dark-skin-guy-showing-big-biceps-wear-casual-outfit-picture-id1167716140?k=20&m=1167716140&s=612x612&w=0&h=AQkVDtPrBi45pYDQRI5PQkq0Ot1QBO8IQmW3ujukR-c=',
      ],
    ),
    Product(
      id: 29,
      name: 'Female Hoodie',
      rating: 5,
      description:
          ' Shop for Women\'s Fashion Hoodies online on Jumia Nigeria. Discover a great selection of Women\'s Fashion Hoodies ✓ Best prices in Nigeria',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/smiling-beautiful-woman-picture-id1255077836?b=1&k=20&m=1255077836&s=170667a&w=0&h=3NEEsAOPINEzoZdWZdwemOkFWalEtp5xEAJCkjU3Ns8=',
        'https://media.istockphoto.com/photos/portrait-of-curious-woman-in-urban-style-hoodie-holding-hand-above-picture-id1249978015?b=1&k=20&m=1249978015&s=170667a&w=0&h=GvsMkDvJL4wIQtfMUjuAMO21FFaLcq-zxjbBZATWI3U=',
      ],
    ),
       
    Product(
      id: 4,
      name: 'Children Wears',
      rating: 4,
      description:
          'The United Nations Convention on the Rights of the Child defines child as a human being below the age of 18 years unless under the law applicable to the child, majority is attained earlier',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/little-fun-cheerful-kid-boy-34-years-old-wearing-yellow-clothes-hold-picture-id1132809592?k=20&m=1132809592&s=170667a&w=0&h=Q-WUf3Q5uNNrphbwczo7WL6g3yqRYOTOsa4UnuqwzuQ=',
        'https://thumbs.dreamstime.com/b/little-cool-kid-boy-years-old-yellow-clothes-talking-mobile-phone-isolated-orange-wall-background-studio-portrait-problem-142095616.jpg'
      ],
    ),
    Product(
      id: 23,
      name: 'Male Adult Hoodie',
      rating: 6,
      description:
          'Shop Adult Hoodies & Sweatshirts from talented designers at Spreadshirt ✓ Many sizes, colors & styles ✓ Get your favorite Adult design today!',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/fashion-portrait-black-man-in-yellow-clothes-on-color-background-picture-id1161603709?k=20&m=1161603709&s=170667a&w=0&h=AAQzLuxz0dsEzZWHYgt7psYWwi_Luwra0l5xZut3Bus=',
        'https://thumbs.dreamstime.com/b/black-man-yellow-hoodie-making-funny-face-color-background-black-man-yellow-hoodie-making-funny-face-having-fun-color-157507874.jpg'
      ],
    ),
    Product(
      id: 24,
      name: 'Female Adult Hoodie',
      rating: 5,
      description:
          'Shop Adult Hoodies & Sweatshirts from talented designers at Spreadshirt ✓ Many sizes, colors & styles ✓ Get your favorite Adult design today!',
      price: 40,
      imageUrl: [
        'https://img.freepik.com/free-photo/girl-dressed-thickly-yellow-background_23-2148333111.jpg?size=626&ext=jpg',
        'https://thumbs.dreamstime.com/b/una-bellissima-brunetta-un-maglione-giallo-e-che-sta-su-uno-sfondo-guarda-termo-le-apre-la-bocca-foto-orizzontale-176398007.jpg'
      ],
    ),
    Product(
      id: 25,
      name: 'Lady\'s Suit',
      rating: 5,
      description:
          'woman in yellow robe holding yellow textile photo Free Apparel Image on Unsplash | Eco friendly clothing, Clothes, Fashion',
      price: 40,
      imageUrl: [
        'https://i.pinimg.com/originals/7b/ae/5d/7bae5d383760e5b92bc0338ffcb66153.jpg'
      ],
    ),
    Product(
      id: 26,
      name: 'Strip Polo',
      rating: 5,
      description:
          'This is the classic striped Polo shirt, soft, comfortable and breathable, it is a must-have for female',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/shot-of-a-young-women-standing-isolated-over-yellow-background-picture-id1329486866?b=1&k=20&m=1329486866&s=170667a&w=0&h=Qe4eK_c5G1iIB6ppMnhy5x2J7Xts2P2Na4keC3G9EVc=',
        'https://media.istockphoto.com/photos/portrait-of-young-women-standing-isolated-over-purple-background-picture-id1329456787?b=1&k=20&m=1329456787&s=170667a&w=0&h=1v4pUHtebKxmQ1O6PeywIKFpRsKzbKLfqFtOeSlS3Fw=',
        'https://media.istockphoto.com/photos/shot-of-a-young-women-standing-isolated-over-orange-background-picture-id1329485631?b=1&k=20&m=1329485631&s=170667a&w=0&h=ClhZj9T8iZl0XgCSq8g42mctlUWAU7ltWXWJE4f6Skk=',
      ],
    ),
    Product(
      id: 27,
      name: 'Woman Hair',
      rating: 5,
      description:
          'xplore Dezango Fashion Zone\'s board Hair Style, ... Hair Style · Flat Twist Braids Styles Braided Hairstyles For Black Women Cornrows',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/pretty-lady-enjoy-warm-spring-breeze-making-curly-hairstyle-flight-picture-id1164891625?b=1&k=20&m=1164891625&s=170667a&w=0&h=_hN5rqSDsz6sUwu90FHK9cB7_KvfrpAokEPsiCIeKnw=',
        'https://media.istockphoto.com/photos/close-up-photo-beautiful-she-her-lady-red-lipstick-pomade-hand-arm-picture-id1145011481?b=1&k=20&m=1145011481&s=170667a&w=0&h=7ZF_yaRO29emMc3-YEqY7ea7SPyTjif5qx9gYMzq1KI=',
      ],
    ),
    

  ];

  List newArrivals = [
    Product(
      id: 1,
      name: 'Gucci Oversize Hoodie',
      rating: 4.7,
      description:
          'Gucci Oversize Hoodie is a stylish wear designed for both male and female with patterns silked with soft fabrics and thread. It can be worn with Joggers, or anything fancy ',
      imageUrl: [
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/arrival1.png',
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/detail2.png'
      ],
      price: 79.99,
    ),
    Product(
      id: 2,
      name: 'Man Coat Rain Jacket',
      rating: 4.7,
      description:
          'Man Coat Rain Jacket is a stylish wear designed for males patterns silked with soft fabrics and thread. It can be worn with Joggers, or anything fancy ',
      imageUrl: [
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/arrival2.png',
        'https://atuoha.github.io/project-assets.github.io/ad-ecom-assets/images/detail3.png'
      ],
      price: 90.15,
    ),

    Product(
      id: 28,
      name: 'Male White Top',
      rating: 5,
      description:
          'Buy Men\'s White Shirts Online. Enjoy safe shopping online with Jumia. ✓Best Price in Nigeria ✓Fast Delivery & Cash on delivery Available',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/young-black-man-pointing-at-blank-space-of-his-clothes-picture-id1169954933?b=1&k=20&m=1169954933&s=170667a&w=0&h=dobSJp5q1Sl1RlrbZRJqPIyA1LBM8cg8xoIsIFm6z0U=',
        'https://media.istockphoto.com/photos/close-up-photo-of-dark-skin-guy-showing-big-biceps-wear-casual-outfit-picture-id1167716140?k=20&m=1167716140&s=612x612&w=0&h=AQkVDtPrBi45pYDQRI5PQkq0Ot1QBO8IQmW3ujukR-c=',
      ],
    ),
    Product(
      id: 29,
      name: 'Female Hoodie',
      rating: 5,
      description:
          ' Shop for Women\'s Fashion Hoodies online on Jumia Nigeria. Discover a great selection of Women\'s Fashion Hoodies ✓ Best prices in Nigeria',
      price: 40,
      imageUrl: [
        'https://media.istockphoto.com/photos/smiling-beautiful-woman-picture-id1255077836?b=1&k=20&m=1255077836&s=170667a&w=0&h=3NEEsAOPINEzoZdWZdwemOkFWalEtp5xEAJCkjU3Ns8=',
        'https://media.istockphoto.com/photos/portrait-of-curious-woman-in-urban-style-hoodie-holding-hand-above-picture-id1249978015?b=1&k=20&m=1249978015&s=170667a&w=0&h=GvsMkDvJL4wIQtfMUjuAMO21FFaLcq-zxjbBZATWI3U=',
      ],
    ),
 
  ];
}
