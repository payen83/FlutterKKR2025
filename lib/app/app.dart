import 'package:flutter/material.dart';
import 'package:mykkrflutter/app/view/home.dart';
import 'package:mykkrflutter/app/view/landing.dart';
import 'package:mykkrflutter/app/view/products.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo 123',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Poppins',
          bodyColor: Color(0xFF4A4A4A),
          displayColor: Color(0xFF4A4A4A), 
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        MyHomePage(title: 'MyKKR App'),
        LandingPage(),
        ProductsPage()
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.block), label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_square), label: 'Todo'
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart), label: 'Products'
          ),
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
      ),
    );
  }
}