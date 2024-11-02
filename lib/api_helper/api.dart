import 'package:http/http.dart' as http;
import 'dart:convert';
class api{
  Future<dynamic>get({required String url,String? Token})async{
    http.Response response=await http.get(Uri.parse(url));
    Map<String,String>Headers={};
    if(Token!=null){
      Headers.addAll({ 'Authorization':'Bearer $Token'});
    }
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception("error error");
    }
  }
  Future<dynamic>post({required url,required dynamic Body,  String? Token})async{
    Map<String,String>Headers={};
    if(Token!=null){
      Headers.addAll(
        {
          'Authorization':'Bearer $Token',
        }
      );
    }
    http.Response response=await http.post(Uri.parse(url),body: Body, headers: Headers,);
    if(response.statusCode==200){
      return jsonDecode(response.body);

    }
    else{
      throw Exception("i think i am a here i am batman ${response.body}");
    }
  }
  Future<dynamic>put({required url,required dynamic Body,  String? Token})async{
    Map<String,String>Headers={};
    Headers.addAll({
      'Content-Type':'application/x-www-form-urlencoded'
    });
    if(Token!=null){
      Headers.addAll(
          {
            'Authorization':'Bearer $Token',

          }
      );
    }
    print("Request Body before request: $Body");
    http.Response response=await http.post(Uri.parse(url),body: Body, headers: Headers,);
    print("Request Body after request: $Body");
    if(response.statusCode==200){
      Map<String,dynamic>data=jsonDecode(response.body);
      print(response.body);
      print(data);
      return data;
    }
    else{
      throw Exception("i think i am a here i am batman ${response.body}");
    }
  }
}





