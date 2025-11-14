import 'package:flutter/material.dart';
import 'package:madshop_ui_savenkova/theme/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String image;
  final String price;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.white, width: 5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A000000),
                        offset: Offset(5, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 7,
                        child: IconButton(
                          onPressed: () {
                            setState(() => isFavorite = !isFavorite);
                          },
                          icon: SvgPicture.asset(
                            'assets/images/hurt.svg',
                            width: 24,
                            height: 30,
                            color: isFavorite ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 7,
                        child: IconButton(
                          onPressed: () {
                            setState(() => isInCart = !isInCart);
                          },
                          icon: SvgPicture.asset(
                            'assets/images/cart.svg',
                            width: 24,
                            height: 24,
                            color: isInCart ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.name,
                style: AppTextStyles.subtitle.copyWith(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                widget.price,
                style: AppTextStyles.titleLarge.copyWith(fontSize: 17),
              ),
            ],
          ),
        );
      },
    );
  }
}
