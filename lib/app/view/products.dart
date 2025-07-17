import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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
            Card(
              margin: EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Text('Product Title', 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
                    child: Image.asset('assets/images/shapes.png', fit: BoxFit.cover),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16,0,16,8),
                    width: MediaQuery.of(context).size.width,
                    child: Text('Price', 
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