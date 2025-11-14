import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'password_screen.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            width: 373,
            height: 442,
            top: -150,
            left: -50,
            child: SvgPicture.asset(
                'assets/images/bubble_2_p2.svg'
            ),
          ),
          Positioned(
            left: -158,
            top: -171,
            width: 402,
            height: 442,
            child: SvgPicture.asset(
                'assets/images/bubble_1_p2.svg'
            ),
          ),

          Positioned(
            width: 373,
            height: 442,
            top: 500,
            left: 87,
            child: SvgPicture.asset(
                'assets/images/bubble_4_p2.svg'
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 394),
                  const Text(
                    'Login',
                    style: AppTextStyles.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Good to see you back!🖤',
                    style: AppTextStyles.subtitle,
                  ),
                  const SizedBox(height: 17),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: AppTextStyles.body,
                      filled: true,
                      fillColor: AppColors.inputBackground,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                  const SizedBox(height: 37),

                  SizedBox(
                    width: double.infinity,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordScreen(),
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
                        'Login',
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
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
                    )
                  )
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }


}