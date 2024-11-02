import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:store/api_helper/api.dart';
class AllCategoriesServices{
 Future <List<dynamic>>getAllCategories()async{
      List<dynamic>data =await api().get(url: 'https://fakestoreapi.com/products/categories');
      return data;
}
}