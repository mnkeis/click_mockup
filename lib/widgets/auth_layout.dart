import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.width * 0.5,
              child: Center(
                child: Image.asset(
                  ImagesConstants.logo,
                  height: size.width * 0.25,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: HalfCard(
                padding: EdgeInsets.symmetric(
                  vertical: size.width * 0.03,
                  horizontal: size.width * 0.08,
                ),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
