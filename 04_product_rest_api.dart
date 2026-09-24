import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool loading = true;
  String? error;
  List products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  // Send a GET request and read the JSON product list.
  Future<void> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
          loading = false;
        });
      } else {
        throw Exception('Request failed');
      }
    } catch (e) {
      setState(() {
        error = 'Could not load products';
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final data = products[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: Image.network(
                          data['image'],
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                        title: Text(data['title']),
                        subtitle: Text(
                          'Price: \$${data['price']}\n'
                          'Category: ${data['category']}',
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}