// ignore_for_file: inference_failure_on_function_return_type

import 'package:click_mockup/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    super.key,
    this.title = '',
    this.value = false,
    required this.icon,
    required this.onChanged,
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
    return SwitchListTile(
      value: value,
      activeColor: ColorsConstants.grey,
      thumbColor: WidgetStatePropertyAll(
        thumbColor,
      ),
      trackColor: WidgetStatePropertyAll(color),
      trackOutlineColor: WidgetStatePropertyAll(color),
      title: Row(
        children: [
          Image.asset(
            icon,
            height: 20,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsConstants.grey,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
      onChanged: onChanged,
    );
  }
}
