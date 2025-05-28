import 'package:flutter/material.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/vertical_image.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';
import 'package:khedma_link/screens/todo_home.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.freelancer,
  });

  final Freelancer freelancer;

  static const List<Map<String, String>> categories = [
    {
      'image': 'assets/images/avatar.jpg',
      'title': 'UI/UX Designer is Needed',
      'id': '0'
    },
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
      height: 100, // Adjusted height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return RoundedContainer(
            width: 190, // Wider container
            height: 90, // Taller container
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            childe: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectDetail(
                    description: "UI/UX designer is needed for a big project",
                    projectId: "12",
                    suggestedPrice: 26,
                    title: "UI/UX",
                  ),
                ),
              ),
              child: Row(
                // Changed to Row for horizontal layout
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50, // Fixed image width
                    height: 50, // Fixed image height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(category['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      category['title']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
