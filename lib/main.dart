import 'package:ad_ecom_ui/components/bottom_nav.dart';
import 'package:ad_ecom_ui/providers/products.dart';
import 'package:ad_ecom_ui/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ProductData(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        debugShowCheckedModeBanner: false,
        home: const BottomNav(),
        routes: {
          DetailsScreen.routeName: (context) => DetailsScreen(),
        },
      ),
    );
  }
}
