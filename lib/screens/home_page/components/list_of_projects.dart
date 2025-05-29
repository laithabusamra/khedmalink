import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/pending_project_screen.dart';

class ListOfProject extends StatelessWidget {
  final Freelancer freelancer;

  const ListOfProject({
    super.key,
    required this.freelancer,
  });

  ApplicationStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
        return ApplicationStatus.accepted;
      case 'rejected':
        return ApplicationStatus.rejected;
      case 'waiting':
      default:
        return ApplicationStatus.waiting;
    }
  }

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Mobile App Development',
        'description': 'Build a Flutter e-commerce app with Firebase backend',
        'price': '\$70',
        'status': 'accepted',
      },
      {
        'title': 'Website Redesign',
        'description': 'Modern redesign for corporate website',
        'price': '\$60',
        'status': 'waiting',
      },
      {
        'title': 'Logo Design',
        'description': 'Create brand identity for startup',
        'price': '\$30',
        'status': 'rejected',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (context, index) {
        final project = projects[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => PendingProjectScreen(
                  pendingProject: PendingProject(
                      projectName: "Mobile Application",
                      description: "we are loking for  a flutter developer",
                      status: ApplicationStatus.accepted),
                ));
          },
          child: Container(
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project['title']!,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text(project['description']!,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: TSizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project['price']!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: TColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _parseStatus(project['status']!) ==
                                ApplicationStatus.accepted
                            ? Colors.green.shade100
                            : _parseStatus(project['status']!) ==
                                    ApplicationStatus.rejected
                                ? Colors.red.shade100
                                : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        project['status']!.toUpperCase(),
                        style: TextStyle(
                          color: _parseStatus(project['status']!) ==
                                  ApplicationStatus.accepted
                              ? Colors.green
                              : _parseStatus(project['status']!) ==
                                      ApplicationStatus.rejected
                                  ? Colors.red
                                  : Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
