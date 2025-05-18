import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/home_categoeies.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/recruite_page/project_applicants/project_applicants_screen.dart';

class RecruiterHomeScreen extends StatefulWidget {
  const RecruiterHomeScreen({super.key});

  @override
  State<RecruiterHomeScreen> createState() => _RecruiterHomeScreenState();
}

class _RecruiterHomeScreenState extends State<RecruiterHomeScreen> {
  List<Map<String, dynamic>> pendingProjects = [
    {
      'id': '1',
      'title': 'Mobile App Development',
      'description': 'Build a Flutter e-commerce app',
      'price': '\$70/hour',
      'applicants': [
        {
          'name': 'sami',
          'role': 'Flutter Developer',
          'offeredPrice': '\$65/hour',
        },
        {
          'name': 'Sarah zaid',
          'role': 'UI/UX Designer',
          'offeredPrice': '\$60/hour',
        },
      ],
    },
    {
      'id': '2',
      'title': 'Website Redesign',
      'description': 'Modern redesign for corporate website',
      'price': '\$60/hour',
      'applicants': [
        {
          'name': 'laith',
          'role': 'UI/UX Designer',
          'offeredPrice': '\$55/hour',
        },
        {
          'name': 'Sarah zaid',
          'role': 'Web Developer',
          'offeredPrice': '\$60/hour',
        },
      ],
    },
    {
      'id': '3',
      'title': 'SEO Optimization',
      'description': 'Improve search rankings',
      'price': '\$50/hour',
      'applicants': [
        {
          'name': 'salem',
          'role': 'SEO Specialist',
          'offeredPrice': '\$45/hour',
        },
      ],
    },
  ];

  List<Map<String, dynamic>> activeProjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Active Projects',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        HomeCategories(
                          freelancer: Freelancer(
                              name: "laith",
                              role: 'graphic',
                              offeredPrice: "\$90"),
                        ),
                        SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeading(
                    title: 'Pending Projects',
                    showActionButton: false,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pendingProjects.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: TSizes.spaceBtwItems),
                    itemBuilder: (context, index) {
                      final project = pendingProjects[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(project['title']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(project['description']),
                              const SizedBox(height: 4),
                              Text(
                                '${project['applicants'].length} applicants',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: TColors.primary),
                              ),
                            ],
                          ),
                          trailing: Text(project['price']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectApplicantsScreen(
                                  projectId: project['id'],
                                  projectTitle: project['title'],
                                  projectDescription: project['description'],
                                  projectPrice: project['price'],
                                  applicants: List.from(project['applicants']),
                                  onAccept: (applicant) {
                                    setState(() {
                                      activeProjects.add({
                                        'projectId': project['id'],
                                        'title': project['title'],
                                        'applicant': applicant,
                                        'status': 'active',
                                      });
                                      pendingProjects.removeAt(index);
                                    });
                                  },
                                  onReject: (applicantIndex) {
                                    setState(() {
                                      pendingProjects[index]['applicants']
                                          .removeAt(applicantIndex);

                                      if (pendingProjects[index]['applicants']
                                          .isEmpty) {
                                        pendingProjects.removeAt(index);
                                      }
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
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
