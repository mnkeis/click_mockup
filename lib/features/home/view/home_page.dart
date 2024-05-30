import 'package:click_mockup/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          HomeSection.home.body,
          Positioned(
            bottom: 15,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: HomeNavigationWidget(
              section: HomeSection.profile,
              onTap: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
