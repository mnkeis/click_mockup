import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/constants/shadow_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    this.expandedContent,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget? expandedContent;
  final Color backgroundColor;

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  ExpandableController expandableController = ExpandableController(
    initialExpanded: false,
  );

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    expandableController.addListener(_listener);
  }

  void _listener() {
    isExpanded = expandableController.expanded;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return HalfCard(
      isShadow: Theme.of(context).brightness == Brightness.light,
      border: Border.all(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.transparent
            : ColorsConstants.pink,
      ),
      boxShadow: ShadowConstants.black10,
      backgrounColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 7,
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 0,
            bottom: 0,
            child: Container(
              width: 15,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 25),
              Expanded(
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    iconColor: ColorsConstants.pink,
                  ),
                  controller: expandableController,
                  header: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Expanded(child: Text('dd/mm/aa')),
                          Expanded(child: Text('hh:mm')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.title,
                        maxLines: isExpanded ? null : 2,
                        overflow: isExpanded ? null : TextOverflow.ellipsis,
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  collapsed: _typeEvent(),
                  expanded: Column(
                    children: [
                      if (widget.expandedContent != null)
                        const SizedBox.shrink()
                      else
                        SizedBox(
                          height: size.width,
                          child: HalfCard(
                            backgrounColor: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(12),
                            isShadow: false,
                            margin: const EdgeInsets.only(top: 10),
                            child: widget.expandedContent,
                          ),
                        ),
                      _typeEvent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _typeEvent() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          HalfCard(
            isShadow: false,
            width: 30,
            height: 30,
            backgrounColor: widget.backgroundColor,
            borderRadius: BorderRadius.circular(7),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            widget.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorsConstants.grey,
                ),
          ),
        ],
      ),
    );
  }
}
