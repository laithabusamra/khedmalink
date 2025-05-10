import 'package:flutter/material.dart';
import 'package:khedma_link/screens/home.dart';
import 'package:khedma_link/screens/home_page/components/vertical_image.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  final List<Map<String, String>> categories = const [
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'UI/UX Designer',
      'id': '0',
    },
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'App Developer',
      'id': '1',
    },
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'SEO Specialist',
      'id': '2',
    },
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'Content Writer',
      'id': '3',
    },
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'Graphic Designer',
      'id': '4',
    },
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'Data Analyst',
      'id': '5',
    },
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'Project Manager',
      'id': '6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return VerticalImageText(
            image: category['image']!,
            title: category['title']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TodoHomeScreen(
                    projectId: category['id']!,
                    projectTitle: category['title']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
