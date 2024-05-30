import 'package:click_mockup/app/utils/dialog_utils.dart';
import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_app_bar.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_dropdown_widget.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/historical/widgets/expanded_list.dart';
import 'package:click_mockup/widgets/widgets.dart';
import 'package:flutter/material.dart';

enum HistoricalOrder {
  oldestToNewest,
  newestToOldest;

  String get name {
    switch (this) {
      case HistoricalOrder.oldestToNewest:
        return 'Oldest to Newest';
      case HistoricalOrder.newestToOldest:
        return 'Newest to Oldest';
    }
  }
}

class HistoricalView extends StatefulWidget {
  const HistoricalView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HistoricalView());
  }

  @override
  State<HistoricalView> createState() => _HistoricalViewState();
}

class _HistoricalViewState extends State<HistoricalView> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 8,
                          ),
                          child: Text(
                            'Histórico de actividad',
                            style: textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ColorsConstants.pink
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '10 Registros',
                                style: textTheme.titleSmall!.copyWith(
                                  color: ColorsConstants.grey,
                                ),
                              ),
                            ),
                            HalfCard(
                              width: 45,
                              height: 45,
                              backgrounColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              isShadow: false,
                              child: PopupMenuButton<HistoricalOrder>(
                                elevation: 5,
                                splashRadius: 1,
                                shadowColor: Colors.black12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                constraints: BoxConstraints(
                                  maxWidth: size.width,
                                  minWidth: size.width,
                                ),
                                icon: const Icon(
                                  Icons.filter_list,
                                  size: 20,
                                ),
                                itemBuilder: (_) {
                                  return HistoricalOrder.values
                                      .map(_order)
                                      .toList();
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await DialogUtils.calendar(
                                  context,
                                  changeDate: (date) {},
                                );
                              },
                              icon: const Icon(
                                Icons.calendar_month,
                                size: 20,
                              ),
                            ),
                            HalfCard(
                              width: 45,
                              height: 45,
                              backgrounColor:
                                  isSearch ? null : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              isShadow: false,
                              onTap: () {
                                setState(() {
                                  isSearch = !isSearch;
                                });
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (isSearch)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: HalfCard(
                          height: 50,
                          borderRadius: BorderRadius.circular(12),
                          isShadow: false,
                          width: size.width * 0.9,
                          /* child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Buscar',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ), */
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: 'Buscar',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 3,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      itemBuilder: (BuildContext context, int index) {
                        return AccordionWidget(
                          title:
                              'Ofrecemos productos y componentes led de la mas alta, Ofrecemos productos y componentes led de la mas alta, Ofrecemos productos y componentes led de la mas alta.',
                          subtitle: 'Tipo de evento',
                          expandedContent: Container(),
                          backgroundColor: ColorsConstants.crimson,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<HistoricalOrder> _order(HistoricalOrder e) {
    return PopupMenuItem(
      onTap: () {},
      child: Text(e.name),
    );
  }
}
