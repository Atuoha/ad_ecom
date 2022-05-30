import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/products.dart';
import '../providers/products.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = 'detials';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = data['id'] as int;
    Product product =
        Provider.of<ProductData>(context, listen: false).findById(id);

    return Center(child: Text('Details'));
  }
}
