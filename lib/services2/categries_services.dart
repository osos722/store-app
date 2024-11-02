import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:store/api_helper/api.dart';
class CategoriesServices{
  Future<List<GetAllProducts>>getAllCategoriesProducts({required String category_name})async{
    
      List<dynamic>data = await api().get(url: 'https://fakestoreapi.com/products/category/${category_name}');
      List<GetAllProducts>productlist = [];
      for (int i = 0; i < data.length; i++) {
        productlist.add(
            GetAllProducts.fromjson(data[i])
        );
      }
      return productlist;
    }
  }
