import '../api_helper/api.dart';
import '../models/product_model.dart';

class UpdateProduct{
  Future<GetAllProducts>updateproduct({required String title,required double price,required String desc,required String image,required String category,required int id})async{
    print("id is $id");
    Map<String,dynamic>data=await api().post(url: 'https://fakestoreapi.com/products/$id', Body:{
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