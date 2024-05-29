import 'package:click_mockup/constants/colors_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class DialogGeneric extends StatelessWidget {
  const DialogGeneric({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onConfirm,
    required this.textButton,
  });

  final String title;
  final String subTitle;
  final String image;
  final VoidCallback onConfirm;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image.isNotEmpty)
              Column(
                children: [
                  Image.asset(
                    image,
                  ),
                  const SizedBox(height: 10),
                ],
              )
            else
              const SizedBox.shrink(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 18,
                    color: ColorsConstants.burgundy,
                  ),
            ),
            if (subTitle.isEmpty)
              const SizedBox.shrink()
            else
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 15,
                        color: ColorsConstants.grey,
                      ),
                ),
              ),
            const SizedBox(height: 25),
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
                    onTap: onConfirm,
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
