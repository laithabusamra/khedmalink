import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';

class ListOfProject extends StatelessWidget {
  const ListOfProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Mobile App Development',
        'description': 'Build a Flutter e-commerce app with Firebase backend',
        'price': '\$70 per hour',
      },
      {
        'title': 'Website Redesign',
        'description': 'Modern redesign for corporate website',
        'price': '\$60 per hour',
      },
      {
        'title': 'Logo Design',
        'description': 'Create brand identity for startup',
        'price': '\$30 per hour',
      },
      {
        'title': 'SEO Optimization',
        'description': 'Improve search rankings for existing site',
        'price': '\$55 per hour',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Get.to(() => const ProjectDetail(
              description:
                  'so we are looking for expert developer who is really good so we can finish our project',
              projectId: '123',
              suggestedPrice: 0,
              title: "Mobile App Development",
              completed: false,
            )), //when we are going to pass our data inside the (projectData : projects[index]) intead of projects i will use my data source
        child: Container(
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projects[index]['title']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Text(
                projects[index]['description']!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  projects[index]['price']!,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
