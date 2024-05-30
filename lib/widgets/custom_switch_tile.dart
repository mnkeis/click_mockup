// ignore_for_file: inference_failure_on_function_return_type

import 'package:click_mockup/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    required this.onChanged,
    super.key,
    this.title = '',
    this.value = false,
    this.icon = '',
  });

  final bool value;
  final String title;
  final String icon;
  final Function(bool) onChanged;

  Color get color =>
      value ? ColorsConstants.grey : ColorsConstants.grey.withOpacity(0.2);

  Color get thumbColor => value ? ColorsConstants.pink : Colors.white;

  @override
  Widget build(BuildContext context) {
    return ListTileSwitch(
      value: value,
      leading: icon.isEmpty
          ? null
          : Image.asset(
              icon,
              height: 20,
              fit: BoxFit.fitHeight,
              color: ColorsConstants.pink,
            ),
      onChanged: onChanged,
      switchType: SwitchType.cupertino,
      switchActiveColor: ColorsConstants.grey.withOpacity(0.2),
      dense: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ColorsConstants.grey,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
