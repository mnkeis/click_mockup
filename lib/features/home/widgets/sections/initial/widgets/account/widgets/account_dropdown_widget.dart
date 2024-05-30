// ignore_for_file: inference_failure_on_function_return_type

import 'package:click_mockup/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class AccountDropdownWidget extends StatelessWidget {
  const AccountDropdownWidget({
    super.key,
    required this.items,
    required this.textInit,
    required this.onChanged,
  });

  final List<String> items;
  final String textInit;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: textInit,
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(12),
      alignment: Alignment.centerRight,
      isExpanded: true,
      iconEnabledColor: Colors.black,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: ColorsConstants.grey,
            fontSize: 18,
          ),
      dropdownColor: Colors.white,
      underline: const SizedBox.shrink(),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorsConstants.grey,
                  fontSize: 18,
                ),
          ),
        );
      }).toList(),
    );
  }
}
