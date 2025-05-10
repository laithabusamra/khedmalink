import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Mobile App Development',
        'description': 'Build a Flutter e-commerce app with Firebase backend',
        'price': '\$70 per hour',
        'completed': true,
      },
      {
        'title': 'Website Redesign',
        'description': 'Modern redesign for corporate website',
        'price': '\$60 per hour',
        'completed': false,
      },
      {
        'title': 'Logo Design',
        'description': 'Create brand identity for startup',
        'price': '\$30 per hour',
        'completed': true,
      },
      {
        'title': 'SEO Optimization',
        'description': 'Improve search rankings for existing site',
        'price': '\$55 per hour',
        'completed': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.white,
        surfaceTintColor: Colors.transparent,
        title: Text("Projects",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black)),
        actions: [
          MenuIcon(
            onPressed: () {},
            iconColor: Colors.black,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              // Safe price parsing
              final priceString = projects[index]['price'] as String;
              final numericString =
                  priceString.replaceAll(RegExp(r'[^0-9.]'), '');
              final priceValue = double.tryParse(numericString) ?? 0.0;

              Get.to(() => ProjectDetail(
                    description: projects[index]['description'] as String,
                    projectId: index.toString(),
                    suggestedPrice: priceValue,
                    title: projects[index]['title'] as String,
                    completed: projects[index]['completed'] as bool,
                  ));
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Status indicator circle
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: projects[index]['completed'] as bool
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              projects[index]['title'] as String,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Text(
                              projects[index]['price'] as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          projects[index]['description'] as String,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
