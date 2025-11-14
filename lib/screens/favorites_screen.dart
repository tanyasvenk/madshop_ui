import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>{

  final List<Map<String, String>> _products = [
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product1.png', 'price': '1990 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product2.png', 'price': '1290 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product1.png', 'price': '2990 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product2.png', 'price': '1790 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product1.png', 'price': '1790 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product2.png', 'price': '1790 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product1.png', 'price': '1790 ₽'},
    {'name': 'Lorem ipsum dolor sit amet consectetur', 'image': 'assets/images/product2.png', 'price': '1790 ₽'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Favorites',
            style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
            ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 260,
            crossAxisSpacing: 5,
            mainAxisSpacing: 8,
              childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = _products[index];
            return ProductCard(
              name: product['name']!,
              image: product['image']!,
              price: product['price']!,
            );
          },
        ),
      )
    );
  }
}
