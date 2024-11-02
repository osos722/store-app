import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services2/update_product.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class updateProductPage extends StatefulWidget {
static String id="updateProduct";

  @override
  State<updateProductPage> createState() => _updateProductPageState();
}

class _updateProductPageState extends State<updateProductPage> {
 String? productName;

 double? price;

 String? Image;

 String? description;

bool isLoad=false;
  @override
  Widget build(BuildContext context) {
    var product=ModalRoute.of(context)?.settings.arguments as GetAllProducts;
    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
      
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  onChanged: (data){
                    productName=data;
                  },
                  decoration: InputDecoration(
                    hintText: "Prouduct Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (data){
                    price=double.tryParse(data);
                  },
                  decoration: InputDecoration(
                      hintText: "Price",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (data){
                    description=data;
                  },
                  decoration: InputDecoration(
                      hintText: "Description",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (data){
                    Image=data;
                  },
                  decoration: InputDecoration(
                      hintText: "Image",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(8)
                      )
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  color: Colors.blueAccent,
                  child: TextButton(onPressed: ()async{
                    isLoad=true;
                    setState(() {

                    });
                    try{
                 var updatedProduct=  await  UpdateProduct().updateproduct(
                        title: productName == null?product.title:productName!,
                        price:price??product.price,
                        desc: description==null ?product.description :description!,
                        image: Image ==null?product.image:Image!,
                        category:product.category,
                     id:product.id,
                   );
                 print(updatedProduct);
                    isLoad=false;}catch(e){}
                    isLoad=false;
                    setState(() {
                    });
                  }, child: Text(
                    "Update"
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
