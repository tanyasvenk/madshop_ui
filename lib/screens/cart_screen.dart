import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/product_in_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, String>> _cartProducts = [
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'image': 'assets/images/product1.png',
      'price': '1990 ₽'
    },
    {
      'name': 'Lorem ipsum dolor sit amet consectetur',
      'image': 'assets/images/product2.png',
      'price': '1290 ₽'
    },
  ];

  int priceInt(String price) => int.parse(price.replaceAll(RegExp(r'[^0-9]'), ''));

  int get totalSum {
    int sum = 0;
    for (var product in _cartProducts) {
      sum += priceInt(product['price']!);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final count = _cartProducts.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Cart',
                style: AppTextStyles.subtitle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(width: 7),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5EBFC),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$count',
                  style: AppTextStyles.subtitle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: _cartProducts.length,
          itemBuilder: (context, index) {
            final product = _cartProducts[index];
            return CartProductCard(
              name: product['name']!,
              image: product['image']!,
              price: product['price']!,
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Total $totalSum ₽',
                style: AppTextStyles.subtitle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 96),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: AppTextStyles.subtitle.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
