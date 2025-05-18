import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/list_of_projects.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required String searchQuery});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Projects Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: TSizes.spaceBtwItems,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ListOfProject(
                freelancer: Freelancer(
                  name: "Freelancer ${index + 1}",
                  role: "Designer",
                  offeredPrice: "\$${50 + index * 15}/hour",
                ),
                projectData: {
                  'title': 'Project ${index + 1}',
                  'description': 'Sample project description',
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
