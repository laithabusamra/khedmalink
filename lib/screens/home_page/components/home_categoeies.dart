import 'package:flutter/material.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/vertical_image.dart';
import 'package:khedma_link/screens/todo_home.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.freelancer,
  });

  final Freelancer freelancer;

  static const List<Map<String, String>> categories = [
    {'image': 'assets/images/Ui_ux.png', 'title': 'UI/UX Designer', 'id': '0'},
    {'image': 'assets/images/Ui_ux.png', 'title': 'App Developer', 'id': '1'},
    {'image': 'assets/images/Ui_ux.png', 'title': 'SEO Specialist', 'id': '2'},
    {'image': 'assets/images/Ui_ux.png', 'title': 'Content Writer', 'id': '3'},
    {
      'image': 'assets/images/Ui_ux.png',
      'title': 'Graphic Designer',
      'id': '4'
    },
    {'image': 'assets/images/Ui_ux.png', 'title': 'Data Analyst', 'id': '5'},
    {'image': 'assets/images/Ui_ux.png', 'title': 'Project Manager', 'id': '6'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return VerticalImageText(
            image: category['image']!,
            title: category['title']!,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TodoHomeScreen(
                  projectId: category['id']!,
                  projectTitle: category['title']!,
                  freelancer: freelancer,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
