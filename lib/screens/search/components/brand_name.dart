import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/enums.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/brand_name.dart';
import 'package:khedma_link/screens/search/components/circular_image.dart';

class BrandCart extends StatelessWidget {
  const BrandCart({
    super.key,
    required this.showBorder,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        childe: Row(
          children: [
            //Icon
            const Flexible(
              child: CirculaerImage(
                isNetworkImage: false,
                image: 'assets/banner/jobsearch.png',
                backgroundColor: Colors.transparent,
                overLayColor: TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProviderNameWithVerifiedIcon(
                      title: 'Green House', brandTextSize: TextSizes.large),
                  Text(
                    "20 offers with recommendation",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
