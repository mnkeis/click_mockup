import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class DialogRequest extends StatelessWidget {
  const DialogRequest({
    super.key,
    required this.title,
    required this.subTitle,
    required this.body,
    this.textButton = '',
    required this.onComfirm,
  });

  final String title;
  final String subTitle;
  final Widget body;
  final String textButton;
  final VoidCallback onComfirm;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: size.width * 0.05,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(subTitle),
            body,
            Row(
              children: [
                Expanded(
                  child: HalfCard(
                    height: 45,
                    backgrounColor: Colors.transparent,
                    border: Border.all(),
                    isShadow: false,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: Text(
                        'Cancelar',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Expanded(
                  child: HalfCard(
                    height: 45,
                    isShadow: false,
                    backgrounColor: ColorsConstants.green,
                    borderRadius: BorderRadius.circular(10),
                    onTap: onComfirm,
                    child: Center(
                      child: Text(
                        textButton,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
