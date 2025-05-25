import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/home_categoeies.dart';
import 'package:khedma_link/screens/home_page/components/list_of_projects.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final freelancer = Freelancer(
      name: "Jack",
      role: "Flutter Developer",
      offeredPrice: "\$70/hour",
    );

    final sampleProjects = [
      {
        'title': 'Mobile App Development',
        'description': 'Build a Flutter e-commerce app with Firebase backend',
        'price': '\$70/hour',
      },
      {
        'title': 'Website Redesign',
        'description': 'Modern redesign for corporate website',
        'price': '\$60/hour',
      },
      {
        'title': 'Logo Design',
        'description': 'Create brand identity for startup',
        'price': '\$30/hour',
      },
      {
        'title': 'SEO Optimization',
        'description': 'Improve search rankings for existing site',
        'price': '\$55/hour',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeTAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const SectionHeading(
                          title: 'Active Projects',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        HomeCategories(freelancer: freelancer),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(
                    title: 'Pending projects',
                    onPressed: null,
                    showActionButton: false,
                  ),
                  ListOfProject(
                    freelancer: freelancer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
