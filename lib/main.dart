import 'package:flutter/material.dart';
import 'package:store/screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:store/screens/update_product.dart';
import 'dart:convert';

import 'package:store/services2/AllProductServices.dart';
import 'package:store/services2/update_product.dart';

import 'api_helper/api.dart';
void main() {
  print(AllProductServices().getallproducts());
  runApp(StorApp());
}

class StorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id:(context)=>HomePage(),
        updateProductPage.id:(context)=>updateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
