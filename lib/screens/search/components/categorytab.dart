import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/layouts/grid_layout.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/job_card_vertical.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/search/components/brand_show_case.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const BrandShoeCase(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                SectionHeading(
                  title: 'prefered ',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                GridLayout(
                  itemCount: 4,
                  iteamBuilder: (_, index) => const JobCardVertical(),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              ],
            ),
          ),
        ]);
  }
}
