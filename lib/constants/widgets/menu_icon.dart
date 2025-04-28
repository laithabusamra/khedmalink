import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });
  final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.menu_14,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: TColors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
