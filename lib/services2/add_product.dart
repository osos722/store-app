import 'package:store/api_helper/api.dart';
import 'package:store/models/product_model.dart';

class  AddProduct{
  Future<GetAllProducts>addproduct({required String title,required String price,required String desc,required String image,required String category})async{
    Map<String,dynamic>data=await api().post(url: 'https://fakestoreapi.com/products', Body:{
    'title':title,
    'price':price,
    'description':desc,
    'image':image,
    'category':category
    }
    );

    return GetAllProducts.fromjson(data);
  }
}