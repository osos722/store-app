
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.products});
   GetAllProducts products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,updateProductPage.id,arguments: products);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children: [Container(
            height: 130,
            width: 220,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0.2),    //that is for edit shadow
                    spreadRadius: 0,
                    offset: Offset(10, 10),
                  )
                ]
            ),
            child: Card(
                  elevation: 10,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            products.title.substring(0,6),
                            style: TextStyle(
                              color:Colors.grey,
                              fontSize: 16,
                            )
                        ),
                        SizedBox(
                          height:3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                               r"$"'${products.price.toString()}',
                                style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 16,
                                )
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

          ),
            Positioned(
              right: 10,
              bottom: 150,
              top: -50,
              child: Image.network(products.image,height: 20,width: 100,
              )
              ),
          ]
      ),
    );
  }
}
