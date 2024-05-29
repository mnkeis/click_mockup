import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/constants/shadow_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class InitialSectionAppBar extends StatelessWidget {
  const InitialSectionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HalfCard(
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 10,
        left: 10,
        right: 10,
      ),
      boxShadow: ShadowConstants.black10,
      child: Row(
        children: [
          Image.asset(
            ImagesConstants.imageProfile,
            height: 45,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Juan!!',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          iconButton(
            icon: ImagesConstants.notification,
            onTap: () {},
          ),
          iconButton(
            icon: ImagesConstants.refresh,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget iconButton({
    required VoidCallback onTap,
    required String icon,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(
        icon,
        height: 22,
        color: ColorsConstants.crimson,
      ),
    );
  }
}
