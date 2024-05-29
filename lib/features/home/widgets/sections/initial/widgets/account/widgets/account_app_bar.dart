import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({
    super.key,
    this.header,
    this.actions = const [],
    this.isBack = true,
  });

  final Widget? header;
  final List<Widget> actions;
  final bool isBack;

  double get itemSize => 42;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          if (isBack)
            iconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () {
                Navigator.pop(context);
              },
            )
          else
            const SizedBox.shrink(),
          const SizedBox(width: 12),
          Expanded(
            child: header == null
                ? Container()
                : HalfCard(
                    height: itemSize,
                    isShadow: false,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    borderRadius: BorderRadius.circular(12),
                    child: header,
                  ),
          ),
          ...actions.map((e) => e),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  static Widget iconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return HalfCard(
      width: 42,
      height: 42,
      margin: const EdgeInsets.only(left: 12),
      shape: BoxShape.circle,
      isShadow: false,
      onTap: onTap,
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
