import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_app_bar.dart';
import 'package:click_mockup/features/home/widgets/sections/initial/widgets/account/widgets/account_dropdown_widget.dart';
import 'package:flutter/material.dart';

class HistoricalView extends StatelessWidget {
  const HistoricalView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HistoricalView());
  }

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
                              color: ColorsConstants.pink,
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_list,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.calendar_month,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 3,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return AccordionWidget(
                          title:
                              'Ofrecemos productos y componentes led de la mas alta.',
                          subtitle: 'Tipo de evento',
                          expandedContent: Container(),
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
}

class AccordionWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget expandedContent;

  const AccordionWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.expandedContent,
  }) : super(key: key);

  @override
  _AccordionWidgetState createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          onTap: _toggleExpand,
        ),
        if (_isExpanded)
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: widget.expandedContent,
          ),
      ],
    );
  }
}
