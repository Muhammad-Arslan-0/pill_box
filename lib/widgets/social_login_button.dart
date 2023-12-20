import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String image;
  final Function() onTap;
  const SocialLoginButton({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey,width: .8)),
          padding: EdgeInsets.all(15),
          child: Image.asset(image)),
    );
  }
}
