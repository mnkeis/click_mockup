import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/initial_section_appbar.dart';
import 'package:click_mockup/widgets/custom_switch_tile.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InitialSectionAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorsConstants.pink,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                CustomSwitchTile(
                  title: 'Notificaciones',
                  value: true,
                  icon: ImagesConstants.notification,
                  onChanged: (value) {},
                ),
                CustomSwitchTile(
                  title: 'Modo oscuro',
                  icon: ImagesConstants.light,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
