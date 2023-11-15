import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Godrej',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Godrej'),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products = [
    Product(name: 'Rinso', price: 20.000),
    Product(name: 'Susu bayi', price: 30.000),
    Product(name: 'Voucher Game', price: 25.000),
    Product(name: 'Popok', price: 26.000),
    Product(name: 'Kopi', price: 38.000),
    Product(name: 'Gula', price: 15.000),
    Product(name: 'Susu', price: 20.000),
    Product(name: 'Pilus', price: 30.000),
    Product(name: 'Aqua', price: 25.000),
    Product(name: 'Eskrim', price: 26.000),
    Product(name: 'Tepung', price: 38.000),
    Product(name: 'Pulsa', price: 15.000),
    Product(name: 'Rinso', price: 20.000),
    Product(name: 'Susu bayi', price: 30.000),
    Product(name: 'Voucher Game', price: 25.000),
    Product(name: 'Popok', price: 26.000),
    Product(name: 'Kopi', price: 38.000),
    Product(name: 'Gula', price: 15.000),
    Product(name: 'Susu', price: 20.000),
    Product(name: 'Pilus', price: 30.000),
    Product(name: 'Aqua', price: 25.000),
    Product(name: 'Eskrim', price: 26.000),
    Product(name: 'Tepung', price: 38.000),
    Product(name: 'Pulsa', price: 15.000),
    // Add more products as needed
  ];

  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Text(widget.title),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Implement your settings button logic here
                // You may want to navigate to the settings page
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement your search logic here
              // You may want to show a search bar or navigate to the search page
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Implement your shopping cart logic here
              // You may want to navigate to the shopping cart page
              _navigateToCartPage();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ALL PRODUCT',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement your "Promosi" button logic here
                },
                child: Text('PROMO'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement your "Nama Produk" button logic here
                },
                child: Text('PRODUCT'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement your "Terlaris" button logic here
                },
                child: Text('BEST SELLER'),
              ),
            ],
          ),
          SizedBox(height: 40),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('Rp ${products[index].price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      _addToCart(products[index].name);
                    },
                    child: Text('Add to Cart'),
                  ),
                  // Add more customization as needed
                );
              },
            ),
          ),
        ], // Closing the Column widget
      ),
    );
  }

  void _addToCart(String productName) {
    setState(() {
      cartItems.add(productName);
      // You can add more logic here, such as updating the total price, etc.
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$productName added to cart.'),
      ),
    );
  }

  void _navigateToCartPage() {
    // Implement navigation logic to the shopping cart page
    // You can pass the cartItems list to the cart page
  }
}
