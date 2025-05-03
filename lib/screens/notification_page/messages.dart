import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/prouduct_title_text.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/brand_name.dart';
import 'package:khedma_link/screens/home_page/components/rounded_image.dart';

class Messages extends StatelessWidget {
  const Messages({
    super.key,
    required this.id,
    required this.onDelete,
  });

  final int id;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RoundedImage(
          imageUrl: 'assets/banner/greenHouse.jpeg',
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: TColors.grey,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProviderNameWithVerifiedIcon(title: ' Green House'),
              Flexible(
                child: ProductTitleText(
                  title: "Just have send an Email",
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Iconsax.trash, color: Colors.red),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
