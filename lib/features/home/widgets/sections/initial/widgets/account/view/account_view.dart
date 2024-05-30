import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_app_bar.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_dropdown_widget.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/staggered_grid_view.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/historical/view/historical_view.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AccountView());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountAppBar(
                  actions: [
                    AccountAppBar.iconButton(
                      icon: Icons.refresh,
                      onTap: () {},
                    ),
                  ],
                  header: AccountDropdownWidget(
                    textInit: 'Account 1',
                    onChanged: (value) {},
                    items: List.generate(3, (index) {
                      return 'Account ${index + 1}';
                    }),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: size.width * 0.05,
                          ),
                          child: Text(
                            'Acciones permitidas (6)',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ColorsConstants.pink
                                      : Colors.white,
                                ),
                          ),
                        ),
                        StaggeredGridView(
                          spacing: size.width * 0.05,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Center(
                child: HalfCard(
                  height: 40,
                  onTap: () {
                    Navigator.of(context).push<void>(HistoricalView.route());
                  },
                  borderRadius: BorderRadius.circular(20),
                  isShadow: false,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.schedule, size: 20),
                      SizedBox(width: 10),
                      Text('Ver históricos'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
