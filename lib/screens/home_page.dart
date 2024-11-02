import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services2/AllProductServices.dart';
import '../widgets/customCart.dart';

class HomePage extends StatelessWidget {
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Tren',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 50),
        child: FutureBuilder<List<GetAllProducts>>(
          future: AllProductServices().getallproducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No products available"));
            } else {
              List<GetAllProducts> products = snapshot.data!;
              return GridView.builder(
                clipBehavior: Clip.none,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20
                ),
                itemBuilder: (context, index) {
                  return

                      CustomCard(products: products[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
