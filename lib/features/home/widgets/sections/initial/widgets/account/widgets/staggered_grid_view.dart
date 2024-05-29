import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_item_card.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/historical/view/historical_view.dart';
import 'package:flutter/material.dart';

enum AccountType {
  fullArm,
  partialArm,
  disarm,
  instantArm,
  geolocatedPanic,
  bypassZone;

  String get name {
    switch (this) {
      case AccountType.fullArm:
        return 'Full Arm';
      case AccountType.partialArm:
        return 'Partial Arm';
      case AccountType.disarm:
        return 'Disarm';
      case AccountType.instantArm:
        return 'Instant Arm';
      case AccountType.geolocatedPanic:
        return 'Geolocated Panic';
      case AccountType.bypassZone:
        return 'Bypass Zone';
    }
  }

  String get color {
    switch (this) {
      case AccountType.fullArm:
        return 'Full Arm';
      case AccountType.partialArm:
        return 'Partial Arm';
      case AccountType.disarm:
        return 'Disarm';
      case AccountType.instantArm:
        return 'Instant Arm';
      case AccountType.geolocatedPanic:
        return 'Geolocated Panic';
      case AccountType.bypassZone:
        return 'Bypass Zone';
    }
  }
}

class StaggeredGridView extends StatelessWidget {
  const StaggeredGridView({
    super.key,
    this.spacing = 15,
  });

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: AccountType.values.length,
      padding: EdgeInsets.all(spacing),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return AccountItemCard(
          color: Colors.blue,
          icon: ImagesConstants.openLock,
          name: AccountType.values[index].name,
          onTap: () {
            Navigator.of(context).push<void>(HistoricalView.route());
          },
        );
      },
    );
  }
}
