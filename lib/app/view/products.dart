import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:mykkrflutter/app/services/api.services.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String imageURL = '';
  List productList = [];

  @override
  void initState(){
    super.initState();
    getProducts();
  }

  void getProducts() async{
    try {
      var result = await api.getHttp('/products');
      if(result!=null){
        setState(() {
          productList = result?['products'];
          print(productList);
        });
      }
    } catch(e){
      log(e.toString());
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       title: Text('Products'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32,),
            for (var product in productList)
            Card(
              margin: EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Text(product['title'], 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                    child: product?['thumbnail'] != imageURL
                    ? Image.network(product['thumbnail'], fit: BoxFit.fitHeight,)
                    : Image.asset('assets/images/shapes.png', fit: BoxFit.cover),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16,0,16,8),
                    width: MediaQuery.of(context).size.width,
                    child: Text("Price: RM ${product['price']}", 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}