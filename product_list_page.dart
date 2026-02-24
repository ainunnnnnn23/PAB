import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String searchQuery = '';
  String selectedCategory = 'All';

  final products = [
    Product(
      id: '1',
      name: 'Laptop Gaming',
      price: 35000000,
      description: 'Laptop gaming performa tinggi',
      category: 'Electronics',
      image: 'assets/images/laptop_gaming.jpg',
    ),
    Product(
      id: '2',
      name: 'Iphone Pro',
      price: 25000000,
      description: 'Smartphone flagship',
      category: 'Gadget',
      image: 'assets/images/iphone_pro.jpg',
    ),
    Product(
      id: '3',
      name: 'Headphones',
      price: 1500000,
      description: 'Noise cancelling',
      category: 'Accessories',
      image: 'assets/images/headphone.jpg',
    ),
    Product(
      id: '4',
      name: 'Tas Laptop',
      price: 50000,
      description: 'Tas Laptop Warna Pink',
      category: 'Accessories',
      image: 'assets/images/tas_laptop.jpg',
    ),
    Product(
      id: '5',
      name: 'Samsung pro',
      price: 20000000,
      description: 'Hp mahal',
      category: 'Gadget',
      image: 'assets/images/samsung_pro.jpg',
    ),
    Product(
      id: '6',
      name: 'Satu set PC Gaming',
      price: 30000000,
      description: 'pc gaming',
      category: 'Electronics',
      image: 'assets/images/satu_set_pc_gaming.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((p) {
      final searchMatch =
          p.name.toLowerCase().contains(searchQuery.toLowerCase());
      final categoryMatch =
          selectedCategory == 'All' || p.category == selectedCategory;
      return searchMatch && categoryMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, _) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          cart.itemCount.toString(),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari Produk...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => searchQuery = v),
            ),
          ),
          DropdownButton<String>(
            value: selectedCategory,
            items: ['All', 'Electronics', 'Gadget', 'Accessories']
                .map((c) => DropdownMenuItem(
                      value: c,
                      child: Text(c),
                    ))
                .toList(),
            onChanged: (v) => setState(() => selectedCategory = v!),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text('Rp ${product.price.toStringAsFixed(0)}'),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<CartModel>()
                                    .addItem(product);
                              },
                              child: const Text('masukkan ke keranjang'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}