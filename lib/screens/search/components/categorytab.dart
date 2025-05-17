import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/list_of_projects.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample freelancer data
    const sampleFreelancer = Freelancer(
      name: "Alex Johnson",
      role: "UI/UX Designer",
      offeredPrice: "\$65/hour",
    );

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
              itemCount: 2, // Number of project items to display
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Single column layout
                mainAxisSpacing: TSizes.spaceBtwItems,
                crossAxisSpacing: TSizes.spaceBtwItems,
                childAspectRatio: 0.75, // Adjust based on your design needs
              ),
              itemBuilder: (context, index) => ListOfProject(
                freelancer: sampleFreelancer, // Pass the Freelancer object
                projectData: {
                  // Sample project data
                  'title': 'Project ${index + 1}',
                  'description': 'Project description goes here',
                  'status': index % 2 == 0 ? 'Active' : 'Pending',
                },
              ),
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
