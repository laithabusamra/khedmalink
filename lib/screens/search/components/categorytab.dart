import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/home_page/components/list_of_projects.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Preferred Section
            const SectionHeading(
              title: 'Preferred',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Projects Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: TSizes.spaceBtwItems,
                crossAxisSpacing: TSizes.spaceBtwItems,
                childAspectRatio: 0.75, // adjust this ratio as needed
              ),
              itemBuilder: (context, index) => const ListOfProject(),
            ),
          ],
        ),
      ),
    );
  }
}

// class CategoryTab extends StatelessWidget {
//   const CategoryTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(TSizes.defaultSpace),
//             child: Column(
//               children: [
//                 const BrandShoeCase(),
//                 const SizedBox(
//                   height: TSizes.spaceBtwItems,
//                 ),
//                 SectionHeading(
//                   title: 'prefered ',
//                   onPressed: () {},
//                 ),
//                 const SizedBox(
//                   height: TSizes.spaceBtwItems,
//                 ),
//                 GridLayout(
//                   itemCount: 4,
//                   iteamBuilder: (_, index) => const ListOfProject(),
//                 ),
//                 const SizedBox(
//                   height: TSizes.spaceBtwItems,
//                 ),
//               ],
//             ),
//           ),
//         ]);
//   }
// }
