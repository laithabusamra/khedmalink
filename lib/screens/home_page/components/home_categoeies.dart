import 'package:flutter/material.dart';
import 'package:khedma_link/screens/home_page/components/vertical_image.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: 'assets/images/Ui_ux.png',
            title: "UI/UX designer",
            onTap: () {},
          );
        },
      ),
    );
  }
}
