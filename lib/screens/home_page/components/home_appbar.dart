import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/text_class.dart';
import 'package:khedma_link/constants/widgets/appbar.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';

class HomeTAppBar extends StatelessWidget {
  const HomeTAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: TColors.grey,
                  )),
          Text(TTexts.homeAppbarSubTitle,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: TColors.black,
                  )),
        ],
      ),
      actions: [
        MenuIcon(
          onPressed: () {},
          iconColor: TColors.black,
        ),
      ],
    );
  }
}
