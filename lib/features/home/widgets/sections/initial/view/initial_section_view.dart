import 'package:click_mockup/features/home/widgets/sections/initial/widgets/initial_section_appbar.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/initial_section_content.dart';
import 'package:flutter/material.dart';

class InitialSectionView extends StatelessWidget {
  const InitialSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InitialSectionAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: InitialSectionContent(),
          ),
        ),
      ],
    );
  }
}
