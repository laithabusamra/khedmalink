import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/todo_home.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Mobile App Development',
        'description': 'Build a Flutter e-commerce app with Firebase backend',
        'price': '\$70 per hour',
        'completed': false,
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
        'completed': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Projects",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
          itemCount: projects.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final project = projects[index];
            final isCompleted = project['completed'] as bool;

            return GestureDetector(
              onTap: isCompleted
                  ? null
                  : () {
                      Get.to(() => TodoHomeScreen(
                            projectId: index.toString(),
                            projectTitle: project['title'] as String,
                            freelancer: const Freelancer(
                                name: "sami",
                                offeredPrice: "70",
                                role: "developer"),
                          ));
                    },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: isCompleted ? Colors.green : Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  project['title'] as String,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Text(
                                project['price'] as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: TColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            project['description'] as String,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
