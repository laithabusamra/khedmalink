// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/product_price.dart';
import 'package:khedma_link/constants/helper_class/prouduct_title_text.dart';
import 'package:khedma_link/constants/helper_class/shadows.dart';
import 'package:khedma_link/constants/widgets/circular_icon.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/brand_name.dart';
import 'package:khedma_link/screens/home_page/components/rounded_image.dart';

class JobCardVertical extends StatelessWidget {
  const JobCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: TColors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: TColors.light,
              childe: Stack(
                children: [
                  const RoundedImage(
                    imageUrl: 'assets/banner/greenHouse.jpeg',
                    applyImageRadius: true,
                    height: 120,
                  ),
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      childe: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            // now iam going to do the Details here
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                      title: "Design a luxury 3d unique logo ",
                      smallSize: true),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  ProviderNameWithVerifiedIcon(
                    title: 'Green House',
                  ),
                ],
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                //price
                //
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: ProductPriceText(
                    price: '55',
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
