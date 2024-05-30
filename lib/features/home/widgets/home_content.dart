/* import 'package:click_mockup/features/home/widgets/home_navigation.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    super.key,
    this.section = HomeSection.home,
  });

  final HomeSection section;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.section.index);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: HomeSection.values.length,
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      itemBuilder: (context, index) {
        final section = HomeSection.values[index];
        return section.body;
      },
    );
  }
} */
