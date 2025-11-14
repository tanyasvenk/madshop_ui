import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'shop_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            width: 373,
            height: 442,
            top: -130,
            left: -50,
            child: SvgPicture.asset(
                'assets/images/bubble_2_p3.svg'
            ),
          ),
          Positioned(
            left: -158,
            top: -171,
            width: 402,
            height: 442,
            child: SvgPicture.asset(
                'assets/images/bubble_1_p3.svg'
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 238),
                  const Text(
                    'Hello!',
                    style: AppTextStyles.titleLarge,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Type your password',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 126),

                  TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: AppTextStyles.body,
                      filled: true,
                      fillColor: AppColors.inputBackground,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 83),

                  SizedBox(
                    width: double.infinity,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShopScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Start',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.subtitle.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
