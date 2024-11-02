import 'package:store/api_helper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class AllProductServices{
 Future <List<GetAllProducts>> getallproducts()async {
   List<dynamic>data=await  api().get(url: 'https://fakestoreapi.com/products');
     List<GetAllProducts>productlist = [];
     for (int i = 0; i < data.length; i++) {
       productlist.add(
           GetAllProducts.fromjson(data[i])
       );
     }
     return productlist;
 }
}
