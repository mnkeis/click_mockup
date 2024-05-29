import 'package:click_mockup/constants/images_constants.dart';
import 'package:click_mockup/widgets/half_card.dart';
import 'package:flutter/material.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({
    super.key,
    required this.title,
    required this.subTitle,
    this.isCheck = true,
  });

  final String title;
  final String subTitle;
  final bool isCheck;

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
            Image.asset(
              ImagesConstants.check,
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.green,
                  ),
            ),
            if (subTitle.isEmpty)
              const SizedBox.shrink()
            else
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            const SizedBox(height: 25),
            HalfCard(
              height: 40,
              width: size.width * 0.45,
              isShadow: false,
              onTap: () => Navigator.pop(context),
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: Text(
                  'Salir',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
