// ignore_for_file: inference_failure_on_function_return_type

import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/constants/shadow_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/view/initial_section_view.dart';
import 'package:click_mockup/features/home/widgets/sections/profile/view/profile_view.dart';
import 'package:click_mockup/features/home/widgets/sections/settings/view/settings_view.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

enum HomeSection {
  settings,
  home,
  profile;

  String get name {
    switch (this) {
      case settings:
        return 'Settings';

      case home:
        return 'Home';

      case profile:
        return 'Profile';
    }
  }

  String get icon {
    switch (this) {
      case settings:
        return ImagesConstants.settings;

      case home:
        return ImagesConstants.home;

      case profile:
        return ImagesConstants.user;
    }
  }

  Widget get body {
    switch (this) {
      case home:
        return const InitialSectionView();

      case settings:
        return const SettingsView();

      case profile:
        return const ProfileView();
    }
  }
}

class HomeNavigationWidget extends StatelessWidget {
  const HomeNavigationWidget({
    super.key,
    this.section = HomeSection.home,
    required this.onTap,
  });

  final HomeSection section;
  final Function(HomeSection homeSection) onTap;

  @override
  Widget build(BuildContext context) {
    return HalfCard(
      borderRadius: BorderRadius.circular(25),
      boxShadow: ShadowConstants.black10,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: HomeSection.values.map((e) {
            final selected = e == section;
            return GestureDetector(
              onTap: () => onTap(e),
              child: Row(
                children: [
                  Image.asset(
                    e.icon,
                    color: selected ? Colors.black : Colors.grey,
                    height: selected ? 18 : 17,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    e.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: selected ? 16 : 13,
                        ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
