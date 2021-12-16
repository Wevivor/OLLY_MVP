import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sorty/utils/custom_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.BACKGROUND_COLOR,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo.png',
              width: 130,
              height: 130,
            ),
            const SizedBox(
              height: 105,
            ),
            LoginButton(
              onPressed: () {},
              image: 'assets/logo/kakao.png',
              color: CustomColor.KAKAO_BUTTON_COLOR,
              text: const Text(
                'Login with KAKAO',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            LoginButton(
                image: 'assets/logo/apple.png',
                onPressed: () {},
                text: const Text('Login with Apple',),
                color: CustomColor.APPLE_BUTTON_COLOR),
            const SizedBox(height: 16,),
            LoginButton(image: 'assets/logo/google.png', onPressed: (){}, text: const Text('Login with Google', style: TextStyle(
              color: Colors.white
            ),), color: CustomColor.GOOGLE_BUTTON_COLOR)
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.image,
    required this.onPressed,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String image;
  final VoidCallback onPressed;
  final Text text;
  final HexColor color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            width: 24,
            height: 24,
          ),
          text,
          const SizedBox(
            height: 24,
            width: 24,
          )
        ],
      ),
    );
  }
}
