import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';
import 'package:khedma_link/screens/recruite_page/add_projects/add_screen.dart';

class AddProjectsScreen extends StatefulWidget {
  const AddProjectsScreen({super.key});

  @override
  State<AddProjectsScreen> createState() => _AddProjectsScreenState();
}

class _AddProjectsScreenState extends State<AddProjectsScreen> {
  List<Map<String, dynamic>> projects = [
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
      'completed': true,
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
      'completed': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text("Create Projects",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Get.to(const AddScreen());
              if (result != null) {
                setState(() {
                  projects.add(result);
                });
              }
            },
          ),
        ],
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
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
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
