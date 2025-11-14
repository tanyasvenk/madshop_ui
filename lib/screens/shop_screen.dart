import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../widgets/product_card.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _currentIndex = 0;

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

  final List<Widget> _pages = [
    const SizedBox(),
    const FavoritesScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _currentIndex == 0
          ? AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Shop',
                style: AppTextStyles.subtitle.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    style: AppTextStyles.body.copyWith(color: const Color(0xFF0042E0)),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: AppTextStyles.body.copyWith(color: const Color(0xFF0042E0)),
                      filled: true,
                      fillColor: const Color(0xFFE5EBFC),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : null,
      body: _currentIndex == 0
          ? Padding(
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
          : _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 84,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), offset: const Offset(0, -1), blurRadius: 1),
          ],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                width: 24,
                height: 24,
                color: _currentIndex == 0 ? Colors.black : AppColors.primary,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/hurt.svg',
                width: 24,
                height: 30,
                color: _currentIndex == 1 ? Colors.black : AppColors.primary,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/cart.svg',
                width: 24,
                height: 24,
                color: _currentIndex == 2 ? Colors.black : AppColors.primary,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
