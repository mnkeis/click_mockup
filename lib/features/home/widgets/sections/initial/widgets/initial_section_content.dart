import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/constants/shadow_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/view/account_view.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class InitialSectionContent extends StatelessWidget {
  const InitialSectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.width * 0.6,
          child: Center(
            child: Image.asset(
              ImagesConstants.logo,
              height: size.width * 0.3,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Center(
          child: Text(
            'Mis cuentas vinculadas (3)',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorsConstants.grey,
                  fontSize: size.width * 0.065,
                ),
          ),
        ),
        ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _Item(
              isOpen: !index.isOdd,
              index: index + 1,
              onTap: () {
                Navigator.of(context).push<void>(
                  AccountView.route(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    this.isOpen = false,
    this.index = 0,
    this.onTap,
  });

  final bool isOpen;
  final int index;
  final VoidCallback? onTap;

  double get itemHeight => 55;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return HalfCard(
      height: itemHeight,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      boxShadow: ShadowConstants.black10,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Mis cuentas $index',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: ColorsConstants.grey,
                    ),
              ),
            ),
          ),
          HalfCard(
            width: itemHeight,
            height: itemHeight,
            borderRadius: BorderRadius.circular(12),
            isShadow: false,
            backgrounColor: backgrounColor,
            child: Image.asset(
              icon,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String get icon {
    if (isOpen) {
      return ImagesConstants.openLock;
    } else {
      return ImagesConstants.closedLock;
    }
  }

  Color get backgrounColor {
    if (isOpen) {
      return ColorsConstants.green;
    } else {
      return ColorsConstants.crimson;
    }
  }
}
